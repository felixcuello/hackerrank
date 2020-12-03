# https://www.hackerrank.com/challenges/fibonacci-fp/problem
defmodule Solution do
  def play(factorial_memory) do
    case IO.read(:stdio, :line) do
      :eof -> nil

      x ->
        x =
          String.trim(x)
          |> String.to_float()

        IO.puts Float.round(expand(x, 0, factorial_memory), 4)
        play(factorial_memory)
    end
  end

  # I had problems with :math.pow so I wrote my own
  def monchopow(_, 0), do: 1
  def monchopow(x, n), do: x * monchopow(x, n-1)

  def expand(_, 10, _), do: 0
  def expand(x, n, factorial_memory) do
    (monchopow(x, n) / Map.get(factorial_memory, n)) + expand(x, n+1, factorial_memory)
  end
end

# Memoization of factorial, just in case
defmodule Factorial do
  def work(memory, 1), do: memory
  def work(memory, n) do
    case Map.has_key?(memory, n) do
      true -> memory
      false ->
        memory =
          memory
          |> work(n-1)

        fact = n * Map.get(memory, n-1)
        Map.put(memory, n, fact)
    end
  end
end

IO.read(:stdio, :line) # ignore the number of cases

Factorial.work(%{0 => 1, 1 => 1}, 50)
|> Solution.play()

