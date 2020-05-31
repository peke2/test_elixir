# 実行するためにはimportしないといけない
# そもそも、DB的なものと思って試してみたが、構造体と似たようなもの？
# 目的の沿わないっぽいので、動かないまま放置しておく (2020.05.31)

defmodule Rec do
  require Record

  Record.defrecord(:sample, name: "test", value: "123");
end

IO.inspect(sample())
