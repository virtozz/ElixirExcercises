defmodule RunLengthEncoder do
  
  # def decode(string) do
  #   Regex.scan(~r/[0-9]+[A-Z]/, string)
  #   |> List.flatten
  #   |> Enum.map(&decode_value/1)
  #   |> Enum.join("")
  # end

  # def decode_value(value) do
  #   char = String.last(value)    
  #   times = String.slice(value, 0..String.length(value)-2)
  #   |> String.to_integer
  #   Stream.repeatedly(fn -> char end)
  #   |> Enum.take(times)
  # end

  def decode(string) do
    Regex.scan(~r/(\d+)(.)/, string)
    |> Enum.map_join(fn [_,n,c] -> String.duplicate(c, String.to_integer(n)) end)
  end

end