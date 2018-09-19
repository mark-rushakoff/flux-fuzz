from(bucket: "telegraf/autogen")
    |> range(start: -5m)
    |> drop(fn: (col) => col =~ /usage*/)