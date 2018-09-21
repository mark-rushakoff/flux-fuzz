// Determine 99th percentile cpu system usage:
from(bucket: "telegraf/autogen")
	|> range(start: -5m)
	|> filter(fn: (r) => r._measurement == "cpu" and r._field == "usage_system")
	|> percentile(p: 0.99)