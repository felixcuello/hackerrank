# https://www.hackerrank.com/challenges/prefix-compression/problem
defmodule Solution do
  def play do
    case IO.read(:stdio, :line) do
      :eof -> nil

      string ->
        a = string |> String.trim() |> String.split("", trim: true)
        b = IO.read(:stdio, :line) |> String.trim() |> String.split("", trim: true)

        work(a, b, %{prefix: ""})
        play()
    end
  end

  def print_array(a) do
    case Enum.count(a) do
      0 -> IO.puts "0"
      n -> IO.puts "#{n} #{Enum.join(a, "")}"
    end
  end

  def dump(a1, a2, s) do
    IO.puts "#{String.length(s)} #{s}"
    print_array(a1)
    print_array(a2)
  end

  def work([], [], memory), do: dump([], [], Map.get(memory, :prefix))
  def work(array1, [], memory), do: dump(array1, [], Map.get(memory, :prefix))
  def work([], array2, memory), do: dump([], array2, Map.get(memory, :prefix))
  def work(array1, array2, memory) do
    [a | rest_a] = array1
    [b | rest_b] = array2

    if a == b do
      updated_memory = memory |> Map.update!(:prefix, fn s -> s <> a end)
      work(rest_a, rest_b, updated_memory)
    else
      dump(array1, array2, Map.get(memory, :prefix))
    end
  end
end

Solution.play()
