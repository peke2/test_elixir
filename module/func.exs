# モジュール
# 同じマッチングでも条件が違うと別々に呼び出せるか？
# 【結論】呼び出し可能

defmodule Sample do
	def func(n) when n<0, do: IO.puts("minus")
	def func(n) , do: IO.puts("plus	")
end