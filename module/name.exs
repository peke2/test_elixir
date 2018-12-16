
# defmodule Sample.Test do
# 	def say do
# 		"Hello"
# 	end
# end

# 以下の様にも書ける
defmodule Sample do
	defmodule Test do
		def say do
			"Hello"
		end
	end
end

IO.puts(Sample.Test.say())
