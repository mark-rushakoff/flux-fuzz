from(bucket: "telegraf/autogen") |> range(start:-5m) |> covariance(columns: ["x", "y"])
