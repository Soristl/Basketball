function sortRankingData(name)
	local tempRankRoom = {}

	for name, data in pairs(rankPlayer) do
		if data.matches >= 0 then
			tempRankRoom[#tempRankRoom + 1] = {
				name = name,
				matches = data.matches,
				wins = data.wins,
				winRatio = winRatioPercentage(data.wins, data.matches),
				def = data.def,
				passes = data.passes,
				assists = data.assists,
				d3 = data.d3,
				d2 = data.d2,
				points = data.d3 + data.d2,
				total = data.def + data.passes + data.assists + data.d3 + data.d2 + data.points
			}
		end
	end

	if rankSettings[name].sort == "total" then
		table.sort(tempRankRoom, function(a, b)
			return a.total > b.total
		end)
	elseif rankSettings[name].sort == "points" then
		table.sort(tempRankRoom, function(a, b)
			return a.points > b.points
		end)
	elseif rankSettings[name].sort == "d2" then
		table.sort(tempRankRoom, function(a, b)
			return a.d2 > b.d2
		end)
	elseif rankSettings[name].sort == "d3" then
		table.sort(tempRankRoom, function(a, b)
			return a.d3 > b.d3
		end)
	elseif rankSettings[name].sort == "assists" then
		table.sort(tempRankRoom, function(a, b)
			return a.assists > b.assists
		end)
	elseif rankSettings[name].sort == "passes" then
		table.sort(tempRankRoom, function(a, b)
			return a.passes > b.passes
		end)
	elseif rankSettings[name].sort == "def" then
		table.sort(tempRankRoom, function(a, b)
			return a.def > b.def
		end)
	elseif rankSettings[name].sort == "winRatio" then
		table.sort(tempRankRoom, function(a, b)
			return a.winRatio > b.winRatio
		end)
	elseif rankSettings[name].sort == "wins" then
		table.sort(tempRankRoom, function(a, b)
			return a.wins > b.wins
		end)
	elseif rankSettings[name].sort == "matches" then
		table.sort(tempRankRoom, function(a, b)
			return a.matches > b.matches
		end)
	end

	return tempRankRoom
end
