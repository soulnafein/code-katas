defmodule MyEnum do
  def all?(collection, func) do
    _all?(collection, func, true)
  end

  defp _all?([], _func, result), do: result;
  defp _all?([head | rest], func, true) do
    _all?(rest, func, func.(head))
  end
  defp _all?(_collection, _func, false), do: false;

  def each(collection, func) do
    _each(collection, func)
  end

  defp _each([], _), do: :ok
  defp _each([head | tail], func) do
    func.(head)
    _each(tail, func)
  end

  def split(collection, position) do
    _split(collection, position, [])
  end

  defp _split(second_half, 0, first_half), do: {first_half, second_half}
  defp _split([], _, first_half), do: {first_half, []}
  defp _split([head | rest], position, first_half) do
    first_half = first_half ++ [head]
    _split(rest, position-1, first_half)
  end

  def take(collection, number) do
    _take(collection, number, [])
  end
  defp _take([], _, result), do: result
  defp _take(_, 0, result), do: result
  defp _take([head | rest], number, result) do
    result = result ++ [head]
    _take(rest, number-1, result)
  end

  def filter(collection, func) do
    _filter(collection, func, [])
  end

  defp _filter([], _, result), do: result
  defp _filter([head | rest], func, result) do
    if func.(head) do
      _filter(rest, func, result ++ [head])
    else
      _filter(rest, func, result)
    end
  end
end
