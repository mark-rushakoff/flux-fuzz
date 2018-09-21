option task = {
    name: "mean",
    every: 1h,
}

from(bucket:"metrics/autogen")
    |> range(start:-task.every)
    |> group(by:["level"])
    |> mean()
    |> yield(name:"mean")