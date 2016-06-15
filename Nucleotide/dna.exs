defmodule DNA do
  
  @dna %{
    ?A => 0,
    ?T => 0,
    ?C => 0,
    ?G => 0
  }

  def count('', n) do
    cond do
      !Map.has_key?(@dna, n) -> raise ArgumentError
      true -> 0
    end
  end
  def count(dna, nucleotide) do    
    map = Enum.group_by(dna, fn(x) -> x end)
    |> Map.new(fn(x) -> 
      key = elem(x, 0)
      value = elem(x, 1)
      {key, Enum.count(value)}
    end)
    Map.get(map, nucleotide)
  end

  def histogram(''), do: @dna
    
end