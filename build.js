const fs = require("fs")
const combine = require("./combine")
const luamin = require("luamin")

combine(
	// List of files and directories in order to be concatenated
	[
		"src/timer.lua",
		"src/main.lua",
		"src/events",
		"src/functions",
		"src/ui",
		"src/init.lua"
	],

	// Output file
	"basket.lua",

	// Optional parameters to alter behaviour
	{
		delimeterBefore: "--[[ ",
		delimeterAfter: " ]]--"
	}
)

// Optionally minify the final output script using luamin
if (process.argv[2] == "minify") {
	console.log("\x1b[32m%s\x1b[0m", "Minifying script...\n")

	var fileContents = fs.readFileSync(
		"basket.lua",
		"utf8",
		function (err, data) {
			if (err) {
				console.log("\x1b[31m%s\x1b[0m", err)
				process.exit(1)
			}
			var originalFile = fs.createWriteStream("basket.lua", {
				flags: "w"
			})
			var minified = luamin.minify(data)
			console.log("\x1b[32m%s\x1b[0m", "[" + minified + "]")
			originalFile.write(minified)
			originalFile.close()
		}
	)

	console.log("\x1b[32m%s\x1b[0m", "Finished minifying!\n")
}
