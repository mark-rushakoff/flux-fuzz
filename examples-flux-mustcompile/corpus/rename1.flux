from(bucket: "telegraf/autogen")
    |> range(start: -5m)
    |> rename(fn: (col) => "{col}_new")