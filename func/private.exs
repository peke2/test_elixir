# 本のサンプルでプライベートの関数が「_」で始まっていた
# 念の為挙動を確認してみた
# 【結果】
# 他の関数との区別のためだけで、「_」で始まっても普通の関数と同じ様に外部から呼び出すことが可能

defmodule Sample do
  def add(a,b), do: a+b

  # 「_」で始まってもプライベートではない
  def _sub(a,b), do: a-b

  # プライベートは「defp」で始まる
  defp mul(a,b), do: a*b
end

IO.puts(Sample.add(1,2))
IO.puts(Sample._sub(1,2)) # 通常の関数呼び出しと同じ
IO.puts(Sample.mul(3,4))  # プライベートなので呼び出し不可
