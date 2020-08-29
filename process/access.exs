# 同じ、または違うプロセス間で値を共有したい場合に使う？
# とりあえず写経

defmodule Counter do
  use Agent
  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def increment do
    Agent.update(__MODULE__, &(&1+1))
  end
end

defmodule Store do
  use Agent
  def start_link([name: name, value: value]) do
    Agent.start_link(fn -> [name: name, value: value] end, name: __MODULE__)
  end

  def value do
    # Agent.get(__MODULE__, fn v-> v end)
    Agent.get(__MODULE__, & &1) # 省略するとここまで縮む
  end

  def update_name(name) do
    # 名前の部分だけを更新してみる
    Agent.update(__MODULE__, &([name: name, value: &1[:value]]))
    # Agent.update(__MODULE__, &(&1))
  end
end


Counter.start_link(0)
IO.puts(Counter.value)
Counter.increment()
IO.puts(Counter.value)

Store.start_link([name: "hello", value: 123])
IO.inspect(Store.value)
Store.update_name("world")
IO.inspect(Store.value)

Counter.increment()
IO.puts(Counter.value)
