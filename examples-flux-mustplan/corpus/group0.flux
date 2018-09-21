from(bucket: "telegraf/autogen") 
    |> range(start: -30m) 
    |> group(by: ["host", "_measurement"])