defmodule Call do
	def get do
		fn n -> n*2 end
	end
end

# 戻り値の関数を呼び出す(「()」の前に「.」がある)
# 対象は無名関数なので、この形式で呼び出す
IO.puts(Call.get.(3))

# 無名(ローカル)関数
a = fn n -> "#{n} world" end
IO.puts(a.("Hello"))
