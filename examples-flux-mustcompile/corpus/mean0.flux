from(bucket:"telegraf/autogen")
    |> filter(fn: (r) => r._measurement == "mem" AND
            r._field == "used_percent")
    |> range(start:-12h)
    |> window(every:10m)
    |> mean()