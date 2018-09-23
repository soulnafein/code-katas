defmodule MyList do
  def max(collection) do
    _max(collection, nil)
  end

  defp _max([], result), do: result
  defp _max([head | tail], nil), do: _max(tail, head)
  defp _max([head | tail], result) when head > result, do: _max(tail, head)
  defp _max([_head | tail], result), do: _max(tail, result)
end
