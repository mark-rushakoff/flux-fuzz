from(bucket: "telegraf/autogen")
    |> range(start: -30m)
    |> filter(fn: (r) => r._measurement == "cpu")
    |> keyValues(fn: (schema) => schema.columns |> filter(fn:(v) =>  v.label =~ /usage_.*/))