defmodule Phone do

  def number(phone_number) do
    phone_number 
    |> parse_phone_number    
  end

  defp parse_phone_number(pn) do
    parsed_pn = Regex.scan(~r/\d+\w?/, pn) |> List.flatten |> Enum.join
    cond do
      String.length(parsed_pn) == 10 -> parsed_pn
      String.length(parsed_pn) == 11 -> separate(parsed_pn)
      true -> "0000000000"        
    end
  end
  defp separate(pn) do
    if String.first(pn) == "1" do
      String.slice(pn, 1..11)
    else
      "0000000000"
    end
  end

  def area_code(pn) do
    cond do
      String.length(pn) == 10 -> do_area_code(pn)
      String.length(pn) == 11 -> separate(pn) |> do_area_code
      true -> "0000000000"
    end
  end
  defp do_area_code(pn) do
    String.slice(pn, 0..2)
  end

  def pretty(pn) do
    cond do
      String.length(pn) == 10 -> do_pretty(pn)
      String.length(pn) == 11 -> separate(pn) |> do_pretty
      true -> "0000000000"
    end
  end
  defp do_pretty(pn) do
    "(#{area_code(pn)}) #{String.slice(pn, 3..5)}-#{String.slice(pn, 6..10)}"
  end

end