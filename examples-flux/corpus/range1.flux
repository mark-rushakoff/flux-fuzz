from(bucket:"telegraf/autogen")
    |> range(start:2018-05-22T23:30:00Z, stop: 2018-05-23T00:00:00Z)
    |> filter(fn: (r) => r._measurement == "cpu" AND
               r._field == "usage_system")