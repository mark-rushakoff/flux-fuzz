from(bucket: "telegraf/autogen")
    |> range(start: -5m)
    |> keep(fn: (col) => col =~ /inodes*/) 