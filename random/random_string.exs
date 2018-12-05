# 使用方法
# 8桁のランダムな文字列を作成する
# 数字のみ
# RandomString.num(8)
# 英数字
# RandomString.alpha(8)
# 記号と英数字
# RandomString.all(8)

defmodule RandomString do
	def generate(0, _chars, result) do
		result
	end

	def generate(n, chars, result) do
		generate(n-1, chars, result ++ [Enum.random(chars)])
	end

	def generate(n, chars) do
		generate(n, chars, [])
	end

	def create(type, n) do
		count = if n <= 0 do
			1
		else
			n
		end

		nums = '0123456789'
		alphas_s = 'abcdefghijklmnopqrstuvwxyz'
		alphas_l = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
		codes = '!"#$%&\'()*+,./:;<=>?[]^_`{|}~-@_'

		target = cond do
			type=="num" -> nums
			type=="alpha" -> nums ++ alphas_s ++ alphas_l
			type=="all" -> nums ++ alphas_s ++ alphas_l ++ codes
		end
		generate(count, target)
	end

	# 数字のみ
	def num(n) do
		create("num", n)
	end

	# 英数字
	def alpha(n) do
		create("alpha", n)
	end

	# 記号、英数字
	def all(n) do
		create("all", n)
	end
end