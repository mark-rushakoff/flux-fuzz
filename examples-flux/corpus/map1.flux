from(bucket:"telegraf/autogen")
    |> filter(fn: (r) => r._measurement == "cpu" AND
                r._field == "usage_system" AND
                r.service == "app-server")
    |> range(start:-12h)
    // create a new table by copying each row into a new format
    |> map(fn: (r) => {_time: r._time, app_server: r._service})