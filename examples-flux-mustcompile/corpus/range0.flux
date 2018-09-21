from(bucket:"telegraf/autogen")
    |> range(start:-12h, stop: -15m)
    |> filter(fn: (r) => r._measurement == "cpu" AND
               r._field == "usage_system")