defmodule CurlTransform.CLI do

  def print_help(name \\ "curl_transform") do
    IO.puts ~s(Usage: #{name} ...
    example: pbpaste | #{name} --golang
    languages: golang)
    System.halt(1)
  end

  def error(string) do
    IO.puts :stderr, string
    System.halt(2)
  end

  def language_error(string), do: error string <> "\nSupported languages: #{Enum.join CurlTransform.supported, ", "}"

  def unsupported_language(language), do: language_error ~s(Language '#{language}' not supported)

  def run(language, nil), do: unsupported_language language

  def run(language, module) do
    case IO.read :stdio, :all do
      :eof             -> error "Pass data through stdio"
      {:error, reason} -> error reason
      data             ->
        try do
          CurlTransform.run module, data
        rescue
          _ -> error "Malformed request"
        end
    end
  end

  def main(args) do
    options = OptionParser.parse(args)
    case options do
      {[help: true], _} -> print_help
      {[], _}           -> print_help
      {languages, [], []} ->
        case Keyword.keys languages do
        []         -> language_error "No language specified."
        [language] -> run language, CurlTransform.lookup(language)
        _          -> language_error "Too many languages specified."
        end
    end
  end
end
