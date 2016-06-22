defmodule DNA do
  
  @dna %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }

  def to_rna(dna) do
  	Enum.map(dna, &(Map.get(@dna, &1)))
  end  
end