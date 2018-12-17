# 1つの関数に複数のボディ
f = fn
	"a" -> "Hello"
	"b" -> "World"
end

IO.puts(f.("a"))	# Hello


