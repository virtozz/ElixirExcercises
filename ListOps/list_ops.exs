defmodule ListOps do

  def count(list) do    
    do_count(0, list)
  end  
  defp do_count(acc, [h | t]) do
    do_count(acc + 1, t)
  end
  defp do_count(acc, []) do
    acc
  end
  
  def reverse(list) do
    do_reverse(list, [])
  end
  defp do_reverse([], acc) do
    acc
  end
  defp do_reverse([h | t], acc) do    
    do_reverse(t, [h | acc])
  end

  def map(list, func) do
    do_map(list, func, [])
    |> reverse()
  end
  defp do_map([h | t], func, acc) do
    do_map(t, func, [func.(h) | acc])
  end
  defp do_map([], _, acc) do
    acc
  end

  def filter(list, func) do
    do_filter(list, func, [])
    |> reverse
  end
  defp do_filter([h | t], func, acc) do
    if func.(h) == true do
      acc = [h | acc]
    end
    do_filter(t, func, acc)
  end
  defp do_filter([], _, acc) do
    acc
  end

  def reduce([h | t], acc, func) do
    reduce(t, func.(h, acc), func)
  end
  def reduce([], acc, _) do
    acc
  end

  def append(list1, list2) do
    do_append(list1, list2, [])
    |> reverse
  end  
  defp do_append([h |t], list2, acc) do
    do_append(t, list2, [h | acc])
  end
  defp do_append([], [h | t], acc) do
    do_append([], t, [h | acc])
  end
  defp do_append([], [], acc) do
    acc
  end

  def concat(ll), do: reverse(ll) |> reduce([], &(append(&1, &2)))
end