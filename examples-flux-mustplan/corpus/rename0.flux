from(bucket: "telegraf/autogen")
    |> range(start: -5m)
    |> rename(columns:{host: "server"})