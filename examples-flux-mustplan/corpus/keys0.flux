from(bucket: "telegraf/autogen")
    |> range(start: -30m)
    |> keys(except: ["_time", "_start", "_stop", "_field", "_measurement", "_value"])