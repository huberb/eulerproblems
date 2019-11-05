defmodule Bla do

  def fac n do fac(1, n) end
  def fac acc, 0 do acc end
  def fac acc, n do fac(n * acc, n - 1) end

  def sum(list) do sum(0, list) end
  def sum(n, []) do n end
  def sum(n, [head | tail]) do 
    Integer.parse(head) |> elem(0) |> Kernel.+(n) |> sum(tail)
  end

  def start do
    fac(100) |> Integer.to_string() |> String.graphemes |> sum() |> IO.puts
  end

end

Bla.start
