# クロージャー
# 関数の外側の name を参照可能
hello = fn name -> (fn -> "Hello #{name}" end) end

# 関数の戻り値が関数なので、呼び出し方に注意
IO.puts(hello.("World").())

# この形でも呼び出し可能
say = hello.("World")
IO.puts(say.())

# もっと簡単に直感的に表す
a = 5
b = 3
add = fn -> a + b end
IO.puts(add.())   # 8

# でも、これはできない(言語的な仕様らしい？)
# https://stackoverflow.com/questions/21982713/recursion-and-anonymous-functions-in-elixir
# Erlang/OTP 22、Elixir 1.9.1 でもできていない(2019.09.14)
# sum = fn
#   0 -> 0
#   n -> n + sum.(n-1)
# end
# IO.puts(sum.(10))
