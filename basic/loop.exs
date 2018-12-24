
a = 2
for _ <- 1..5 do
  IO.puts(a)    # 2 ずっと「2」のまま
  a = a + 1
  IO.puts(a)    # 3 ずっと「3」のまま
  IO.puts("--------")
end

IO.puts(a)
a = a + 1
IO.puts(a)
a = a + 1
IO.puts(a)
a = a + 1
IO.puts(a)

IO.puts("--------")
array = for n <-[1,2,3,4] , do: n*3
# array = [3,6,9,12]
for i<-array do
  IO.puts(i)
end
