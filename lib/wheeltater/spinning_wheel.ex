defmodule Wheeltater.SpinningWheel do
  alias Wheeltater.SpinningAgent

  def start_wheel(points) do
    SpinningAgent.start_link(points)
  end

  def stop_wheel do
  end

  def wheel_points do
    SpinningAgent.get_points()
  end
end
