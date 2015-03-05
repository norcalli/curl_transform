defmodule CurlTransform do
  @table %{
    golang: Golang,
    python2: Python2,
    python3: Python3,
  }

  @aliases %{
    py2: :python2,
    py3: :python3,
  }

  def lookup(name), do: @table[Dict.get(@aliases, name, name)]

  def supported, do: Dict.keys(@aliases) ++ Dict.keys(@table)

  def run(transform, string) do
    IO.puts [
      Regex.run(~r/^curl '([^']+)'/, string) |> List.last |> transform.url_map,
      Regex.scan(~r/-H '([^']+)'/, string) |> Enum.map_join(transform.header_join, fn [_, match] ->
        [header, " " <> value] = String.split(match, ":", parts: 2)
        header = Helpers.capitalize_splits(header, "-")
        transform.header_map header, value
        # apply(map[transform], [header, value])
        end),
      transform.close,
    ] |> Enum.join "\n"
  end
end
