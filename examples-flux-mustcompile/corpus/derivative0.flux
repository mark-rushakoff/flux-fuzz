from(bucket: "telegraf/autogen")
    |> range(start: -5m)
    |> filter(fn: (r) => r._measurement == "disk" and r._field == "used_percent")
    |> derivative(nonNegative: true, columns: ["used_percent"])