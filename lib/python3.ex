defmodule Python3 do
  def url_map(url) do
    ~s|import urllib.request
url = "#{url}"
with urllib.request.urlopen(url) as req:|
  end

  def header_map(name, value), do: "  req.add_header('#{name}', '#{value}')"

  def header_join, do: "\n"

  def close, do: ~s|
  data = req.read()
|
end
