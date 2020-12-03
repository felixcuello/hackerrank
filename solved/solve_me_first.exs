defmodule Solution do
  def play() do
    case IO.read(:stdio, :line) do
      :eof -> nil

      a ->
        a = a |> String.trim |> String.to_integer()
        b = IO.read(:stdio, :line) |> String.trim |> String.to_integer()

        IO.puts a + b
        play()
    end
  end
end

Solution.play()


