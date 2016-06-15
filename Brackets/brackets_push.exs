defmodule BracketPush do
  
  @brackets %{
    "(" => ")",
    "{" => "}",
    "[" => "]"
  }

  def check_brackets(string) do
    br = Regex.scan(~r/[\(\)\[\]\{\}]/, string) |> List.flatten    
    do_check(br, [])
  end
  
  defp do_check([], []), do: true
  defp do_check([], _), do: false
  defp do_check([h | t], acc) do
    cond do
      Map.has_key?(@brackets, h) -> do_check(t, [Map.get(@brackets, h) | acc])
      Enum.empty?(acc) and !Map.has_key?(@brackets, h) -> false
      h == hd(acc) -> do_check(t, tl(acc))
      h != hd(acc) -> false
      true -> true
    end  
  end

end