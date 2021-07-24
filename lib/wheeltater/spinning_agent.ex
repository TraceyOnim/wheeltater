defmodule Wheeltater.SpinningAgent do
  use Agent

  alias Wheeltater.Core

  def start_link(points) do
    Agent.start_link(fn -> points end, name: __MODULE__)
    :timer.apply_interval(1000, __MODULE__, :update_points, [])
  end

  def get_points do
    if GenServer.whereis(__MODULE__) do
      Agent.get(__MODULE__, & &1)
    else
      Core.points()
    end
  end

  def update_points do
    Agent.get_and_update(__MODULE__, fn state -> {state, Core.new_points(state)} end)
  end
end
