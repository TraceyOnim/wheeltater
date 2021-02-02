defmodule WheeltaterWeb.PageLive do
  use WheeltaterWeb, :live_view

  use Phoenix.HTML

  alias Wheeltater.Core

  @impl true
  def mount(_params, _session, socket) do
    points = Core.points()
    {:ok, assign(socket, sections_with_color: Core.section_with_color(points))}
  end

  def render(assigns) do
    ~L"""

        <pre>
          <%= raw svg_head() %>
          <%= for {section, color} <- @sections_with_color do %>
             <%= raw wheel_sections(section, color) %>
          <% end %>
          <%= raw svg_footer() %>
          <button phx-click="spin">Spin</button>

        </pre>

    """
  end

  def handle_event("spin", _, socket) do
    points = for {section, _color} <- socket.assigns.sections_with_color, do: section

    new_points =
      points
      |> Core.new_points()
      |> Core.section_with_color()

    {:noreply, socket |> assign(sections_with_color: new_points)}
  end

  def svg_head do
    """
     <svg height="600" width="500">
    """
  end

  def svg_footer, do: "</svg>"

  def wheel_sections(section, color) do
    """
     
      <polygon points= "#{polygon_points(section)}" style="fill:#{color};stroke:purple;stroke-width:2" />

    """
  end

  def polygon_points(section) do
    section
    |> Enum.map(fn {x, y} -> "#{x} #{y}, " end)
    |> Enum.join()
    |> String.trim_trailing(", ")
  end
end
