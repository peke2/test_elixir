# フィボナッチ

defmodule Fibo do
	# フィボナッチの処理
	def exec(0, memo), do: {0,memo}
	def exec(1, memo), do: {1,memo}
	def exec(n, memo \\ %{}) do
		if Map.has_key?(memo, n) == false do
			a = exec(n-2, memo)
			{v0, memo} = a
			b = exec(n-1, memo)
			{v1, memo} = b
			val = v0 + v1
			memo = Map.put(memo, n, val)
			{val, memo}
		else
			{memo[n], memo}
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
# n = [0,1,2,3,4,5,6]
memo = %{}
for i <- n  do
	# 常にforの前にあるmemoが参照されているようで、サイズは「0」のまま
	IO.puts( "memo size=#{map_size(memo)}" )
	# 関数の戻り値からmemoを取り出して次の呼び出しに使っているつもりだが、for文で参照されるものは最初に定義されているmemo(サイズ0)
	{ans, memo} = Fibo.exec(i, memo)
	IO.puts( ans )
end
