defmodule Sum do
  def calc(0) do
    0
  end

  def calc(n) do
    n + calc(n-1)
  end
end

IO.puts(Sum.calc(10))
