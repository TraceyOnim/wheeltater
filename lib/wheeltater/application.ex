defmodule Wheeltater.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WheeltaterWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wheeltater.PubSub},
      # Start the Endpoint (http/https)
      WheeltaterWeb.Endpoint
      # Start a worker by calling: Wheeltater.Worker.start_link(arg)
      # {Wheeltater.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wheeltater.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WheeltaterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
