from(bucket:"telegraf/autogen")
    |> filter(fn: (r) => r._measurement == "system" AND
               r._field == "uptime")
    |> range(start:-12h)
    |> sort(cols:["region", "host", "value"])