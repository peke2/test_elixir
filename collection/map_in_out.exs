output = fn map ->
  for {k,v} <- map do
    IO.puts("#{k}=>#{v}")
  end
  IO.puts("--------")
end

map = %{1=>"a", 2=>"b", 3=>"c"}
output.(map)
# 要素を追加
map = Map.put(map, 4, "d")
output.(map)

# 関数内で要素を追加して返す
add = fn map ->
  Map.put(map, 5, "e")
end

map = add.(map)
output.(map)

