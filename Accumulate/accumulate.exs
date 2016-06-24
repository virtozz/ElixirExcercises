defmodule Accumulate do
  def accumulate(list \\ [], fun) do
  	Enum.reduce(list, [], fn(x, acc) -> [fun.(x) | acc] end)
  	|> Enum.reverse
  end
end