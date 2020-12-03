# https://www.hackerrank.com/challenges/filter-elements/problem?h_r=next-challenge&h_v=zen
defmodule Solution do
  def play do
    case IO.read(:stdio, :line) do
      :eof -> nil

      constraints ->
        [_, k] = constraints |> String.split(~r/\s+/, trim: true)

        k = k |> String.to_integer()
        elements =
          IO.read(:stdio, :line)
          |> String.split(~r/\s+/, trim: true)

        result =
          work(elements, k, %{elements: elements})
          |> String.trim()

        case result do
          "" -> IO.puts "-1"

          _ ->
            IO.puts result
        end

        play()
    end
  end

  def work([], _, %{elements: []}), do: ""

  def work([], k, memory) do
    [n | rest] = memory[:elements]

    if memory[n] >= k do
      updated_memory =
        memory
        |> Map.update!(n, fn _ -> 0 end)
        |> Map.update!(:elements, fn _ -> rest end)
      "#{n} " <>  work([], k, updated_memory)
    else
      updated_memory =
        memory
        |> Map.update!(n, fn _ -> 0 end)
        |> Map.update!(:elements, fn _ -> rest end)
      work([], k, updated_memory)
    end
  end

  def work(elements, k, memory) do
    [head | tail] = elements

    updated_memory =
      case memory |> Map.has_key?(head) do
        true ->
          memory |> Map.update!(head, fn n -> n+1 end)

        false ->
          memory |> Map.put(head, 1)
      end

    work(tail, k, updated_memory)
  end
end

IO.read(:stdio, :line) # ignore first line
Solution.play
