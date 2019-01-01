defmodule Knapsack do
  def proc([], _w, v, memo) do
    {v, memo}
  end

  def proc(knaps, w, v, memo \\ %{}) do
    index = length(knaps)
    value = if !Map.has_key?(memo, index) do
      # 状態に合った価値が残っていなければ計算
      [k|ks] = knaps

      {v0, memo} = if (w - k[:w]) >= 0 do
        # 自分を加えた場合
        proc(ks, w-k[:w], v+k[:v], memo)
      else
        {0, memo}
      end

      # 自分を加えなかった場合
      {v1, memo} = proc(ks, w, v, memo)

      # 価値の大きい方をとる
      value = max(v0, v1)
      if Map.has_key?(memo, index) do
        max(memo[index], value)
      else
        value
      end
    else
      memo[index]
    end
    {value, Map.put(memo, index, value)}
  end
end

# ファイルの各行を読み込んで、空白でパースしてタプルに入れる
defmodule Reader do
  def readLines(device) do
    line = case IO.read(device, :line) do
      {:error, _} -> nil
      :eof -> nil
      data -> List.to_tuple(String.split(data))
    end
    if line != nil do
      [line | readLines(device)]
    else
      []
    end
  end

  def read(fname) do
    readLines(File.open!(fname))
  end
end

# ファイルの行に定義された値を内部で使えるよう整形
lines = Reader.read("knaps.txt")
knaps = for l <- lines do
  {w, v} = l
  # 内部では整数値のマップで扱う
  %{w: String.to_integer(w), v: String.to_integer(v)}
end

# knaps = [%{w: 1,v: 2},%{w: 3,v: 1},%{w: 2,v: 3}]
{v, _} = Knapsack.proc(knaps, 15, 0)
IO.puts v
