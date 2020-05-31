#無限に繰り返す
#乱数を生成
#一番大きい数を5つ選出したら終了


:rand.seed(:exsplus, {1,2,3})
l = Stream.iterate(1, &(&1+1))
|> Stream.map(fn _n -> :rand.uniform(100) end)
|> Stream.take(5)

IO.inspect(Enum.to_list(l))
