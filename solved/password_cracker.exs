# https://www.hackerrank.com/challenges/password-cracker-fp/problem
defmodule Solution do
  def play do
    case IO.read(:stdio, :line) do
      :eof -> nil

      _ ->
        words =
          IO.read(:stdio, :line)
          |> String.trim()
          |> String.split(~r/\s+/, trim: true)
          |> Enum.reduce(%{}, fn x, acc -> acc |> Map.merge(%{x => true}) end)

        pass =
          IO.read(:stdio, :line)
          |> String.trim()

        crack(
          pass |> String.split("", trim: true),
          %{
            current_pass: "",
            found_pass: [],
            words: words,
            status: true
          }
        )
        |> IO.puts

        play()
    end
  end

  def crack([], memory) do
    case Map.get(memory, :status) do
      # We finished with a password match, the status is true and this is a
      # perfect password :-)
      true -> Map.get(memory, :found_pass) |> Enum.join(" ")

      # In this case we were in the middle of a string that couldn't be matched
      # so the status is "false" therefore there's no password substring matched
      false -> "WRONG PASSWORD"
    end
  end

  def crack(pass_array, memory) do
    [letter | rest] = pass_array
    current_pass = Map.get(memory, :current_pass) <> letter
    updated_memory = Map.update!(memory, :current_pass, fn _ -> current_pass end)

    case Map.get(memory, :words) |> Map.has_key?(current_pass) do
      true ->
        # We found a word so we set the status to true, and add the current_pass
        # to the list of passwords used. Also reset the current_pass to ""
        updated_memory =
          updated_memory
          |> Map.update!(:status, fn _ -> true end)
          |> Map.update!(:found_pass, fn a -> a ++ [current_pass] end)
          |> Map.update!(:current_pass, fn _ -> "" end)

        crack(rest, updated_memory)

      false ->
        # Set the status to false because we couldn't find any password matching the
        # current substring
        updated_memory = updated_memory |> Map.update!(:status, fn _ -> false end)
        crack(rest, updated_memory)
    end
  end
end

IO.read(:stdio, :line) # Discard T
Solution.play()
