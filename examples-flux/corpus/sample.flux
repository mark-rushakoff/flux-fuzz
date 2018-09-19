from(bucket:"telegraf/autogen")
    |> filter(fn: (r) => r._measurement == "cpu" AND
               r._field == "usage_system")
    |> range(start:-1d)
    |> sample(n: 5, pos: 1)