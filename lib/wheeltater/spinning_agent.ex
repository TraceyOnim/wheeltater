defmodule Wheeltater.SpinningAgent do
  use Agent

  alias Wheeltater.Core

  def start_link(points) do
    Agent.start_link(fn -> points end, name: __MODULE__)
  end

  def get_points do
    if GenServer.whereis(__MODULE__) do
      Agent.get(__MODULE__, & &1)
    end
  end

  def update_points do
    Agent.update(__MODULE__, fn points ->
      points |> Core.new_points()
    end)
  end
end
