defmodule Bob do
  
  def hey(statement) do
    cond do
      isSilence(statement) -> "Fine. Be that way!"
      isQuestion(statement) -> "Sure."
      isShout(statement) -> "Whoa, chill out!"
      true -> "Whatever."
    end    
  end

  defp isSilence(statement) do
    String.strip(statement) == ""
  end

  defp isQuestion(statement) do
    String.ends_with?(statement, "?")
  end

  defp isShout(statement) do
    String.upcase(statement) == statement && Regex.match?(~r/\p{L}+/, statement)
  end

end