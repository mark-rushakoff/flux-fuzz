from(bucket:"telegraf/autogen")
    |> filter(fn: (r) => r._measurement == "cpu" AND
                r._field == "usage_system" AND
                r.service == "app-server")
    |> range(start:-12h)
    // Square the value
    |> map(fn: (r) => r._value * r._value)