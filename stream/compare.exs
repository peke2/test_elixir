#流れの中で、結果を保持しつつ比較して答えを導くような使い方は可能か？
#無限に繰り返す
#乱数を生成
#一番大きい数を5つ選出したら終了

# 確認用に乱数のシードを固定する(パラメータは適当な数値)
:rand.seed(:exsplus, {1,2,3})

l = Stream.iterate(1, &(&1+1))
|> Stream.map(fn _n -> [:rand.uniform(100)] end)  # リストで扱うため、値をリストにしておく
|> Stream.scan(fn a,b -> a ++ b end)              # 今までの結果を次に残すための方法？？
|> Stream.filter(fn l ->
  [h|t] = l
  if length(t) == 0 || h > Enum.min(t) do
    true
  else
    false
  end
end)
|> Stream.take(5)

IO.inspect(Enum.to_list(l))


