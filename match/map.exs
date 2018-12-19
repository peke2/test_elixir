a = %{"a"=>1, "b"=>2}
b = %{"c"=>3, "d"=>4}
c = %{"c"=>3, "d"=>5}

# マッチングは上から順番に判定される
say = fn 
	%{"a"=>_, "b"=>_} -> "Hello"
	%{"c"=>_, "d"=>_} -> "World"
	%{"c"=>_, "d"=>5} -> "Japan"	# 常に上の行でマッチするので、この行はマッチしない警告が出る
end

IO.puts(say.(a))	#Hello
IO.puts(say.(b))	#World
IO.puts(say.(c))	#World

say = fn 
	%{"a"=>_, "b"=>_} -> "Hello"
	%{"c"=>_, "d"=>5} -> "Japan"	# この順番ならば問題ない
	%{"c"=>_, "d"=>_} -> "World"
end

IO.puts(say.(a))	#Hello
IO.puts(say.(b))	#World
IO.puts(say.(c))	#Japan
