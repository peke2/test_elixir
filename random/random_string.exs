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

	# def create(n) do
	# 	#:rand.seed(:exs1024)
	# 	target = []
	# 	nums = '0123456789'
	# 	alphas_s = 'abcdefghijklmnopqrstuvwxyz'
	# 	alphas_l = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
	# 	codes = '!"#$%&\'()*+,./:;<=>?[]^_`{|}~-@_'
	# 	target = target ++ alphas_s ++ alphas_l ++ codes ++ nums
	# 	create(n, target, [])
	# end

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


end