from(bucket:"telegraf/autogen")
    |> range(start:-12h)
    |> window(every:10m)
    |> max()