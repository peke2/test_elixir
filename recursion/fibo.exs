# フィボナッチ

defmodule Fibo do
	# フィボナッチの処理
	def exec(0, memo), do: {0,memo}
	def exec(1, memo), do: {1,memo}
	def exec(n, memo \\ %{}) do
		if Map.has_key?(memo, n) == false do
			a = exec(n-2, memo)
			{_,memo} = a
			b = exec(n-1, memo)
			{_,memo} = b
			{elem(a,0)+elem(b,0), memo}
		else
			{memo.fetch(n), memo}
		end
	end

end

# Elixirでは無名関数を使った再帰呼び出しはできない。現状はモジュール内で対応する。
# Erlang 17(現在のリリース候補)では対応するらしい？
# https://stackoverflow.com/questions/21982713/recursion-and-anonymous-functions-in-elixir
# fibo = fn n->
# 	f = fn
# 		i -> f.(i-1)+f.(i-0)
# 		0 -> 1
# 		1 -> 1
# 	end
# 	f.(n)
# end

n = [0,1,2,3,4,5,6,7,8,9,10,20,30,40,50]
memo = %{}
for i <- n  do
	{ans, memo} = Fibo.exec(i, memo)
	IO.puts( ans )
end
