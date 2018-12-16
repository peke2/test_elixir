
#defmodule MyList do
defmodule Mylist do
  def len([]), do: 0
  #def len([h|t]), do: 1 + len(t)	# 「warning: variable "h" is unused」が出る
  def len([_h|t]), do: 1 + len(t)	# 変数の頭に「_」をつけると警告が出なくなる
end

IO.puts Mylist.len([])
IO.puts Mylist.len([1,2,3,6,8,2,1])
