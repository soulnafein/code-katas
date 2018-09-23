defmodule Chop do
  def guess(number_to_guess, range) do
    min..max = range
    halfway = div(max-min, 2)+min
    IO.puts("It is #{halfway}")
    _guess(halfway, number_to_guess, range)
  end

  def _guess(guessed_number, number_to_guess, range) when guessed_number < number_to_guess do
    min..max = range
    new_range = (guessed_number + 1 )..max
    guess(number_to_guess, new_range)
  end

  def _guess(guessed_number, number_to_guess, range) when guessed_number > number_to_guess do
    min..max = range
    new_range = min..(guessed_number - 1)
    guess(number_to_guess, new_range)
  end

  def _guess(guessed_number, number_to_guess, range) when guessed_number == number_to_guess do
  end
end
