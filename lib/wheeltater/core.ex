defmodule Wheeltater.Core do
  @location {200, 300}

  def points do
    [
      [{200, 200}, {250, 250}, {200, 300}],
      [{250, 250}, {300, 300}, {200, 300}],
      [{250, 350}, {300, 300}, {200, 300}],
      [{250, 350}, {200, 400}, {200, 300}],
      [{150, 350}, {200, 400}, {200, 300}],
      [{100, 300}, {150, 350}, {200, 300}],
      [{150, 250}, {100, 300}, {200, 300}],
      [{200, 200}, {150, 250}, {200, 300}]
    ]
  end

  def section_with_color(points) do
    colors = [:red, :blue, :yellow, :green, :purple, :pink, :orange, :cyan]

    points
    |> Enum.zip(colors)
    |> Map.new()
  end

  def rotate_90(points, {a, b} = location) do
    Enum.map(points, fn section ->
      Enum.map(section, fn
        @location -> location
        {x, y} -> {-(y - b) + a, x - a + b}
      end)
    end)
  end

  def new_points(points) do
    points
    |> rotate_90(@location)
  end

  # def list_of_immations do
  #   [
  #     "dance",
  #     "singing",
  #     "developer",
  #     "pick_up_line",
  #     "frog_jump",
  #     "modelling",
  #     "geeky",
  #     "bird_sound"
  #   ]
  # end
end
