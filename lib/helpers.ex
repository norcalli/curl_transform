defmodule Helpers do
  def capitalize_splits(string, split) do
    String.split(string, split) |> Enum.map_join split, &String.capitalize/1
  end
end
