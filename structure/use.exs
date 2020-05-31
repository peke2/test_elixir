# importしないとダメっぽい？
# 【実行方法】
# $ elixir -r struct.exs use.exs

import Test

test = %Test{}

IO.inspect(test)

test = %Test{name: "hello"}

IO.inspect(test)
