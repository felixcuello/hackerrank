# https://www.hackerrank.com/challenges/fibonacci-fp/problem
defmodule Solution do
  def play(memory) do
    case IO.read(:stdio, :line) do
      :eof -> nil

      n ->
        number = String.trim(n) |> String.to_integer()
        IO.puts Map.get(memory, number)
        play(memory)
    end
  end
end

defmodule Fibo do
  def work(memory, 1), do: memory
  def work(memory, n) do
    case Map.has_key?(memory, n) do
      true ->
        memory
      false ->
        memory =
          memory
          |> work(n-1)
          |> work(n-2)

        sum = rem(Map.get(memory, n-1) + Map.get(memory, n-2), 100000007)
        Map.put(memory, n, sum)
    end
  end
end

IO.read(:stdio, :line) # Discard number of tests, we will work on this until it ends :-)

Fibo.work(%{0 => 0, 1 => 1}, 100000)
|> Solution.play()

