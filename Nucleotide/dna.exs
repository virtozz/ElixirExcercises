defmodule DNA do
  
  @dna %{
    ?A => 0,
    ?T => 0,
    ?C => 0,
    ?G => 0
  }

  def count('', n) do
    cond do
      !key_valid?(n) -> raise ArgumentError
      true -> 0
    end
  end
  def count(dna, nucleotide) do    
    map = do_count!(dna)
    Map.get(map, nucleotide)
  end

  def histogram(''), do: @dna
  def histogram(dna) do
    map = do_count!(dna)
    Map.merge(@dna, map)
  end

  defp do_count!(dna) do
    Enum.group_by(dna, fn(x) -> x end)
    |> Map.new(fn(x) -> 
      key = elem(x, 0)
      value = elem(x, 1)
      if !key_valid?(key), do: raise ArgumentError
      {key, Enum.count(value)}
    end)
  end
  defp key_valid?(key), do: Map.has_key?(@dna, key)

end