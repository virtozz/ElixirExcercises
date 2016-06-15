defmodule Sublist do
  
  def compare(a, b) do
    case { length(a), length(b) } do
      { la, lb } when la < lb ->
        if sublist?(a, b, la, lb), do: :sublist, else: :unequal
      { la, lb } when la > lb ->
        if sublist?(b, a, lb, la), do: :superlist, else: :unequal
      _ ->
        if a == b, do: :equal, else: :unequal
    end
  end

  defp sublist?(_, _, len_a, len_b) when len_a > len_b, do: false
  defp sublist?([], _, _, _ ), do: true
  defp sublist?(a, b = [_ | t], len_a, len_b) do
    if try_sublist?(a, b) do
      true
    else
      sublist?(a, t, len_a, len_b - 1)
    end
  end

  defp try_sublist?([], _), do: true
  defp try_sublist?([x|at], [x|bt]), do: try_sublist?(at, bt)
  defp try_sublist?(_, _), do: false

end