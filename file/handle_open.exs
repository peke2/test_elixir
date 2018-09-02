#コード例の写経

handle_open = fn
  {:ok, file} -> "最初の1行: #{IO.read(file, :line)}"
  {_, error} -> "エラー: #{:file.format_error(error)}"
end

# 存在するファイルを開く
IO.puts handle_open.(File.open("Rakefile"))
# そして、存在しないファイルを開こうとする
IO.puts handle_open.(File.open("nonexistent"))
