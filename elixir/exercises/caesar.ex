defmodule Caesar do
  def decode(text, steps) do
    _decode(text, steps, '')
  end

  defp _decode('', _, decoded_text), do: decoded_text
  defp _decode([character | undecoded_text], steps, decoded_text) do
    [a | _] = 'a'
    [z | _] = 'z'
    decoded_character = Integer.mod((character+steps)-a, 25+1) + a
    Integer.mod((z+1)-a, 25+1)
    _decode(undecoded_text, steps, decoded_text ++ [decoded_character])
  end
end
