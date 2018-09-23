defmodule Exercises.MyString do
  def capitalize_sentences(sentences) do
    sentences
    |> String.split(". ")
    |> Enum.map(&(capitalize_sentence/1))
    |> Enum.join(". ")
  end

  defp capitalize_sentence(sentence) do
    sentence
    |> String.capitalize
  end
end
