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
