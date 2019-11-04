# リストの要素合計を List.foldl/3 を使ってやってみる
# List.foldl/3 の動作を自分で試しに書いてみる

defmodule Pseudo do
  def foldl([], acc, func) do
    func.(0,acc)
  end

  def foldl(x, acc, func) do
    [h|t] = x
    foldl(t, func.(h,acc), func)
  end

end


IO.puts(List.foldl([1,2,3,4,5,6,7,8,9,10], 0, fn a,b -> a+b end))
IO.puts(Pseudo.foldl([1,2,3,4,5,6,7,8,9,10], 0, fn a,b -> a+b end))
