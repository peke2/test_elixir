
# 自分自身は呼べない？？
defmodule Total do
  def add(1), do: 1
  # 複数行で記述も可能
  def add(n) do
    n+add(n-1)
  end
end

IO.puts Total.add(10)

# 関数の中から他の関数は呼べる
func2 = fn (a,b)->a+b end
func1 = fn a->func2.(a,a) end

IO.puts func1.(4)
