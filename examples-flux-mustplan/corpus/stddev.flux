from(bucket: "telegraf/autogen") 
    |> range(start: -5m)
    |> filter(fn: (r) => r._measurement == "cpu" and r._field == "usage_system")
    |> stddev()