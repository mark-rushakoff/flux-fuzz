from(bucket: "telegraf/autogen")
    |> range(start: -5m)
    |> keep(columns: ["_time", "_value"])