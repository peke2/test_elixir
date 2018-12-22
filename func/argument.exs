# Rubyで引数にMap(Hash)を渡すと、関数内で参照先の内容を更新できた
# Elixirではどうなるのか？
# 【結果】
# 引数で渡したマップの内容は変わらない

# 引数で渡されたマップに要素を追加
addMap = fn map ->
  Map.put(map, :Hello, "World")
end

map = %{Say: "Hello"}
addedMap = addMap.(map)  # 変数をキャメルにしても使えるか確認 → 特に問題なし
# AddedMap = addMap.(map)  # 先頭を大文字にするとだめだった

IO.puts("元のmap");
for a <- map do
  {b, c} = a
  IO.puts("#{b} => #{c}")
end

IO.puts("要素追加後のmap");
for a <- addedMap do
# for a <- AddedMap do
    {b, c} = a
  IO.puts("#{b} => #{c}")
end

# 【出力】
# 元のmap
# Say => Hello
# 要素追加後のmap
# Hello => World
# Say => Hello

