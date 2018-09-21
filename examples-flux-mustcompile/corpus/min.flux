from(bucket:"telegraf/autogen")
    |> range(start:-12h)
    |> filter(fn: (r) => r._measurement == "cpu" AND r._field == "usage_system")
    |> min()