defmodule Exercises.MyExpressionTest do
  use ExUnit.Case, async: true

  test "Sum" do
    assert(Exercises.MyExpression.calculate('123 + 12') == 135)
    assert(Exercises.MyExpression.calculate('100 - 10') == 90)
    assert(Exercises.MyExpression.calculate('6 * 5') == 30)
    assert(Exercises.MyExpression.calculate('144/12') == 12)
  end
end
