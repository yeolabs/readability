defmodule Readability.DescriptionFinder do
  @doc """
  Find description, using og tag first, then fallback to description tag
  """
  def description(html_tree) do
    case find(html_tree, "meta[property='og:description']") do
      nil -> find(html_tree, "meta[name='description']")
      elem -> elem
    end
  end

  defp find(html_tree, selector) do
    first_elem = html_tree
    |> Floki.find(selector)
    |> List.first

    case first_elem do
      nil -> nil
      elem -> elem |> Floki.attribute("content") |> List.first
    end
  end
end
