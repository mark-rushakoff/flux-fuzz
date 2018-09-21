from(bucket: "telegraf/autogen")
	|> range(start: -5m)
	|> shift(shift: 1000h)