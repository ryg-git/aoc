defmodule Key2 do
    defp inp("") do
        [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    end

    defp inp(filename) do
        {:ok, input} = File.read(filename)
        input
            |> String.split("\n", trim: true)
            |> Enum.map(&(Integer.parse(&1)))
            |> Enum.map(fn {num, _} -> num end)
    end

    def solution do
        find_ans(inp("lib/day1/key2input"), 0, 0) - 1
    end

    defp find_ans([], _, cnt), do: cnt
    defp find_ans([_], _, cnt), do: cnt
    defp find_ans([_, _], _, cnt), do: cnt
    defp find_ans(li, pre, cnt) do
        [a, b, c | _] = li
        n = if a + b + c > pre, do: cnt + 1, else: cnt
        [_ | t] = li
        find_ans(t, a + b + c, n)
    end
end
