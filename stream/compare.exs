#流れの中で、結果を保持しつつ比較して答えを導くような使い方は可能か？
#  【結論】可能
#無限に繰り返す
#乱数を生成
#一番大きい数を5つ選出したら終了

# 確認用に乱数のシードを固定する(パラメータは適当な数値)
:rand.seed(:exsplus, {1,2,3})

l = Stream.iterate(1, &(&1+1))
|> Stream.map(fn _n -> :rand.uniform(100) end)
|> Stream.transform([], fn
  n,[] ->
    IO.write("first=")
    IO.inspect(n)
    {[n], [n]}  # 結果を保持するため、アキュムレータをリストで返す
  n,acc ->
    IO.puts("n=#{n}")

    acc = if Enum.min(acc) > n do
      IO.puts("add=#{n}")
      # 小さければ追加
      acc ++ [n]
    else
      IO.puts("del=#{n}")
      acc
    end

    # 終了条件
    # 要素を5つ取得
    # 最後に追加されたものが「1」 -> これより小さい数字が出ないので無限ループになるのを防ぐため
    if length(acc) == 5 || List.last(acc) == 1 do
      IO.inspect(acc)
      {:halt, acc}
    else
      {acc, acc}
    end
end)
# |> Stream.filter(fn l ->
#   [h|t] = l
#   if length(t) == 0 || h > Enum.min(t) do
#     true
#   else
#     false
#   end
# end)
# |> Stream.take(5)
|> Stream.run()

# IO.inspect(Enum.to_list(l))
