# https://www.hackerrank.com/challenges/missing-numbers-fp/problem
defmodule Solution do
  def play do
    case IO.read(:stdio, :line) do
      :eof -> nil

      _ ->
        array1 = IO.read(:stdio, :line) |> String.trim |> String.split(" ", trim: true)
        IO.read(:stdio, :line) # discard this line
        array2 = IO.read(:stdio, :line) |> String.trim |> String.split(" ", trim: true)

        ha = ad_hoc_reduce(%{}, array1)
        hb = ad_hoc_reduce(%{}, array2)

        diff(array2, %{ha: ha, hb: hb})
        |> Enum.sort
        |> Enum.join(" ")
        |> IO.puts
    end
  end

  def diff([], _), do: []
  def diff(b, state) do
    [e | rest] = b

    ha = Map.get(state, :ha)
    hb = Map.get(state, :hb)
    if ha[e] < hb[e] do
      updated_hb = Map.update!(hb, e, fn _ -> -1 end)
      updated_state = Map.update!(state, :hb, fn _ -> updated_hb end)

      [e] ++ diff(rest, updated_state)
    else
      diff(rest, state)
    end
  end

  def ad_hoc_reduce(hash, []), do: hash
  def ad_hoc_reduce(hash, array) do
    [a | rest] = array
    updated_hash =
      if Map.has_key?(hash, a) do
        Map.update!(hash, a, fn v -> v+1 end)
      else
        Map.put(hash, a, 1)
      end
    ad_hoc_reduce(updated_hash, rest)
  end
end

Solution.play
