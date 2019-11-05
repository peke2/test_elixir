defmodule Calc do
  def sum([]), do: 0
  def sum(list) do
    [head | tail] = list
    head + sum(tail)
  end
end
