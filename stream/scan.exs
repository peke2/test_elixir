
#scanの引数確認
#func の引数が (element(), acc()) -> any()) なので、実際の挙動を確認してみた
#直感的には「前の値」「今の値」の順番になりそうな印象があったが、そうではない
Stream.iterate(1, &(&1+1))
|> Stream.scan(fn a,b->
  IO.puts("it:"<>Integer.to_string(a))
  IO.puts("prev:"<>Integer.to_string(b))
  a
end)
|> Stream.take(6)
|> Stream.run()

# 【結果】最初の要素はscanされないでaccに渡される。戻り値はつぎのaccになる
# it:2
# prev:1
# it:3
# prev:2
# it:4
# prev:3
# it:5
# prev:4
# it:6
# prev:5
