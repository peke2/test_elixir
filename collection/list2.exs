# 1〜10までの数値で偶数のみのリストを作る
# a = for i <- 1..10, rem(i,2) == 0, do: i

# こっちの書き方でもOK
# 1行にした時の区切りの「,」と「:」が覚えたく無いというか何というか…
a = for i <- 1..10, rem(i,2) == 0 do
   i
end
IO.inspect(a)

# 組み合わせのリストを生成
b = for i<-1..3, j<-1..3, k<-1..3 do
  [i,j,k]
end

IO.inspect(b)
IO.puts("要素数=#{length(b)}")
