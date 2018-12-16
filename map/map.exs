map = %{"a"=>1, "b"=>2, "c"=>3}
IO.puts(map["b"])

# アトムを使った場合
atom = %{abc: 4, def: 5, ghi: :a6}
IO.puts(atom[:ghi])

#atom2 = %{:abc=>7, def: 8, :ghi=>9}	# 混在はダメっぽい
atom2 = %{:abc=>7, :def=> 8, :ghi=>9}
IO.puts(atom2[:def])
