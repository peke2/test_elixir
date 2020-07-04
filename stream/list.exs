
# Stream中で、リスト内の数値が文字で扱われるかどうかの確認
# 特にStreamは関係なく、リストは同じ挙動だった
l = Stream.iterate(32, &(&1+1))
|> Stream.map(&(&1*2))
|> Stream.take(5)

list = Enum.to_list(l)
# リストでASCIIコードに当たる箇所は文字として表示される
IO.inspect(list)  # '@BDFH' シングルクゥオートは「文字リスト」
IO.inspect("@BDFH") # "@BDFH" ダブルクォートは「文字列」
[a|_] = list

# 数値そのものと、リストに入れた場合の出力のされ方の違い
IO.puts("#{Integer.to_string(a)}")  # 64
IO.puts("#{a}") # 64
IO.puts("#{[a]}") # @
