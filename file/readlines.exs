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


lines = Reader.read("lines.txt")
for l <- lines do
  {w, v} = l
  IO.puts "#{w},#{v}"
end
