# フィボナッチ

defmodule Fibo do
	# 非対応時の処理
	def exec(n, _map \\ %{}) when n < 0, do: 0

	# フィボナッチの処理
	def exec(0, _map), do: 0
	def exec(1, _map), do: 1

	def exec(n, _map \\ %{}) do
		if Map.has_key?(_map, n) == false do
			ans = exec(n-2, _map) + exec(n-1, _map)
			_map = %{_map | n=>ans}
		else
			%{^n=>ans} = _map
		end
		ans
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

IO.puts(Fibo.exec(0))
# IO.puts(fibo.(1))
# IO.puts(fibo.(2))
# IO.puts(fibo.(3))
# IO.puts(fibo.(4))
