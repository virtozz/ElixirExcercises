defmodule DNA do
  
  def hamming_distance(dna1, dna2)  when length(dna1) == length(dna2) do
    do_calc(dna1, dna2, 0)
  end
  def hamming_distance(_, _), do: nil
  
  defp do_calc([h1 | t1], [h2 | t2], acc) when h1 != h2, do: do_calc(t1, t2, acc + 1)
  defp do_calc([h1 | t1], [h2 | t2], acc), do: do_calc(t1, t2, acc)
  defp do_calc([], [], acc), do: acc

end