filterCols = (fn) => (schema) => schema.columns |> filter(fn:(v) => fn(col:v))

from(bucket: "telegraf/autogen")
    |> range(start: -30m)
    |> filter(fn: (r) => r._measurement == "cpu")
    |> keyValues(fn: filterCols(fn: (col) => col.label =~ /usage_.*/))