defmodule Exercises.MyExpression do
  def calculate(expression) do
    _calculate(expression, 0, 0, nil)
  end

  defp _calculate([], first_value, second_value, operator) do
    case operator do
      ?+ -> first_value + second_value
      ?- -> first_value - second_value
      ?* -> first_value * second_value
      ?/ -> first_value / second_value
    end
  end

  defp _calculate([digit | rest], first_value, second_value, nil)
  when digit in '0123456789' do
    first_value = (first_value * 10) + (digit - ?0)
    _calculate(rest, first_value, second_value, nil)
  end

  defp _calculate([digit | rest], first_value, second_value, operator)
  when digit in '0123456789' do
    second_value = (second_value * 10) + (digit - ?0)
    _calculate(rest, first_value, second_value, operator)
  end

  defp _calculate([operator | rest], first_value, second_value, nil)
  when operator in '+-/*' do
    _calculate(rest, first_value, second_value, operator)
  end

  defp _calculate([digit | rest], first_value, second_value, operator)
  when digit in ' ' do
    _calculate(rest, first_value, second_value, operator)
  end
end
