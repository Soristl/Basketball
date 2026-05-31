function createMatchRankingPlayer(name, team)
	if rankPlayerMatch[name] == nil then
		rankPlayerMatch[name] = {
			name = name,
			color = team,
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

		return
	end

	rankPlayerMatch[name].color = team
end
