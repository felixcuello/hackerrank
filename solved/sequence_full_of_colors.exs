# https://www.hackerrank.com/challenges/sequence-full-of-colors/problem
defmodule Solution do
  def play do
    case IO.read(:stdio, :line) do
      :eof -> nil

      string ->
        string
        |> String.trim
        |> String.split("", trim: true)
        |> work(
          %{
            "R" => 0,
            "G" => 0,
            "B" => 0,
            "Y" => 0,
            string: string,
            rule3: true,
            rule4: true
          })

        play()
    end
  end

  def work([], memory) do
    case is_full_of_colors?(memory) do
      true -> IO.puts "True"
      false -> IO.puts "False"
    end
  end

  def work(chars, memory) do
    [char | remaining_chars] = chars

    char = String.upcase(char)
    updated_memory =
      memory
      |> Map.update!(char, fn n -> n+1 end)
      # Difference between the number of red balls and green balls in every prefix of the sequence is at most 1.
      |> fn m ->
            if abs(m["R"] - m["G"]) > 1 do
              m |> Map.update!(:rule3, fn _ -> false end)
            else
              m
            end
         end.()
      # Difference between the number of yellow balls and blue balls in every prefix of the sequence is at most 1
      |> fn m ->
           if abs(m["Y"] - m["B"]) > 1 do
             m |> Map.update!(:rule4, fn _ -> false end)
           else
             m
           end
         end.()

    work(remaining_chars, updated_memory)
  end

  def is_full_of_colors?(memory) do
    (memory["R"] == memory["G"]) && # There are as many red balls as green balls.
    (memory["Y"] == memory["B"]) && # There are as many yellow balls as blue balls
    (memory[:rule3]) &&
    (memory[:rule4])
  end
end

IO.read(:stdio, :line)
Solution.play()
