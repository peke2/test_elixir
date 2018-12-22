a = 1

# 束縛
a = 2

IO.puts(a)  # 2

a = 3
IO.puts(a)  # 3

map = %{1=>"a", 2=>"b", 3=>"c"}

# pin演算子で思いつく使い方
# 変数aに束縛するのではなくリテラルとして使う場合
%{^a => b} = map
IO.puts(b)  # c

