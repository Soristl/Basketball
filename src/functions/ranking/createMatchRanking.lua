function createMatchRanking()
	for i = 1, #playersRed do
		local name = playersRed[i].name

		rankPlayerMatch[name] = {
			name = name,
			color = "red",
			matches = 0,
			wins = 0,
			winRatio = 0,
			def = 0,
			passes = 0,
			assists = 0,
			d3 = 0,
			d2 = 0,
			points = 0,
			total = 0
		}
	end

	for i = 1, #playersBlue do
		local name = playersBlue[i].name

		rankPlayerMatch[name] = {
			name = name,
			color = "blue",
			matches = 0,
			wins = 0,
			winRatio = 0,
			def = 0,
			passes = 0,
			assists = 0,
			d3 = 0,
			d2 = 0,
			points = 0,
			total = 0
		}
	end
end
