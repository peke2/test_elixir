map = %{"a"=>1, "b"=>2, "c"=>3}
IO.puts(map["b"])

# アトムを使った場合
atom = %{abc: 4, def: 5, ghi: :a6}
IO.puts(atom[:ghi])

#atom2 = %{:abc=>7, def: 8, :ghi=>9}	# 混在はダメっぽい
atom2 = %{:abc=>7, :def=> 8, :ghi=>9}
IO.puts(atom2[:def])


a = if Map.has_key?(atom, :ghi) do
  atom[:ghi]
else
  "no exists"
end
IO.puts("#{a}")

# Map.fetchの戻り値の確認
#a = Map.fetch(map, "b")   # 「exists」
a = Map.fetch(map, "e")   # 「no exists」
case a do
  {:ok,_} -> IO.puts("exists")
  :error -> IO.puts("no exists")
end


