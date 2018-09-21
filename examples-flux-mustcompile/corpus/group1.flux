from(bucket: "telegraf/autogen")
    |> range(start: -30m)
    |> group(except: ["_time"])