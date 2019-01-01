# 出力は[1,2,3]
o = for i <- 1..3 do
  i
end

case o do
  [1,2,3] -> IO.puts("OK")
  _ -> IO.puts("NG")
end

for i<- o, do: IO.puts(i)

