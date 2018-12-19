
defmodule  Connect do
	def a(i) do
		case i do
			0 -> "Hello"
			1 -> "Bye"
		end
	end

	def b(s, n) when s=="Hello" do
		n * 3
	end

	def b(_s, n) do
		n * 5
	end

	# 関数の結果を他の関数の引数に使う場合、普通の言語で書くと内側から外側に向けて関数の呼び出しが並ぶ
	def c0 do
		b(a(1), 3)
	end

	# 短いので実感できないと思うが、関数の呼び出し順番でそのまま記述可能
	def c1 do
		a(1)
		|> b(3)	# 上の関数の戻り値が「第一引数」になる
	end
end

IO.puts(Connect.c0)
IO.puts(Connect.c1)
