defmodule Golang do
  def url_map(url) do
    ~s|req, err := http.NewRequest("GET", "#{url}", nil)|
  end

  def header_map(name, value), do: "req.Header.Add(\"#{name}\", `#{value}`)"

  def header_join, do: "\n"

  def close, do: ~s|
resp, err := http.DefaultClient.Do(req)
if err != nil {
  return nil
}
defer resp.Body.Close()
  |
end
