from(bucket:"mydb/autogen")
    |> range(start:2018-05-08T20:50:00Z, stop:2018-05-08T20:51:00Z)
    |> group(by:["_start","_stop", "region", "host"])
    |> mean()
    |> group(by:["_start","_stop", "region"])
    |> yield(name:"mean")