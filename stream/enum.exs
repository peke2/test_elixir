s = Stream.map([1,2,3,4], &(&1+&1))
# 結果はこの時点では計算されていない
IO.inspect(s)         #Stream<[enum: [1, 2, 3, 4], funs: [#Function<49.33009823/1 in Stream.map/2>]]>

# リストにした時点で結果が出る
ss = Enum.to_list(s)
IO.inspect(ss)        #[2, 4, 6, 8]
