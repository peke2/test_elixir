output = fn map ->
  for {k,v} <- map do
    IO.puts("#{k}=>#{v}")
  end
  IO.puts("--------")
end

# 要素を追加
map = %{1=>"a", 2=>"b", 3=>"c"}
output.(map)
map = Map.put(map, 4, "d")
output.(map)
