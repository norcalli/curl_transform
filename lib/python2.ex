defmodule Python2 do
  def url_map(url) do
    ~s|import urllib2
url = "#{url}"
req = urllib2.urlopen(url)|
  end

  def header_map(name, value), do: "req.add_header('#{name}', '#{value}')"

  def header_join, do: "\n"

  def close, do: ~s|data = req.read()
req.close()
|
end
