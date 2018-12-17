# クロージャー
# 関数の外側の name を参照可能
hello = fn name -> (fn -> "Hello #{name}" end) end

# 関数の戻り値が関数なので、呼び出し方に注意
IO.puts(hello.("World").())

# この形でも呼び出し可能
say = hello.("World")
IO.puts(say.())
