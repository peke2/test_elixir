# 無限列挙の確認
# Haskellだと 1.. の範囲指定ができるが、Elixirにはない
# 遅延評価のストリームを使うことで実現が可能
use Bitwise

l = Stream.iterate(5, &(&1+1)) |> Enum.take(6)
IO.inspect(l)

#6,12,18,24,30
mul3 = fn x->x*3 end

l = Stream.iterate(1, &(&1+1))
|>Stream.map(mul3)
|>Stream.reject(&( (&1 &&& 1) == 1))
|>Enum.take(5)
IO.inspect(l)

