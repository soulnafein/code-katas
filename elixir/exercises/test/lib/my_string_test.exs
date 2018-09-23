defmodule Exercises.MyStringTest do
  use ExUnit.Case, async: true

  test "Capitalize" do
    input = "i like DOGs. you should totally OWN a dog. DOGS are AMAZING."
    expected_output = "I like dogs. You should totally own a dog. Dogs are amazing."
    assert(Exercises.MyString.capitalize_sentences(input) == expected_output)
  end
end
