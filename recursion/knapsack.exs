defmodule Knapsack do
  def proc([], _w, v) do
    v
  end

  def proc(knaps, w, v) do
    [k|ks] = knaps

    v0 = if (w - k[:w]) >= 0 do
      # 自分を加えた場合
      proc(ks, w-k[:w], v+k[:v])
    else
      0
    end
    # 自分を加えなかった場合
    v1 = proc(ks, w, v)
    if v0 > v1 do
      v0
    else
      v1
    end
  end
end

knaps = [%{w: 1,v: 2},%{w: 3,v: 1},%{w: 2,v: 3}]
IO.puts Knapsack.proc(knaps, 3, 0)
