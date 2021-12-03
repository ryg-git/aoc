defmodule Key1 do
    def solution do
        {:ok, input} = File.read("lib/day1/key1input")
        [_, ans] = input
            |> String.split("\n", trim: true)
            |> Enum.map(&(Integer.parse(&1)))
            |> List.foldl(
                [0, 0],
                fn e, acc ->
                    case acc do
                        [pre, cnt] when e > pre -> [e, cnt + 1]
                        [_, cnt] -> [e, cnt]
                    end
                end
            )
        ans - 1
    end
end
