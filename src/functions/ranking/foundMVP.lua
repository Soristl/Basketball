function foundMVP()
	local tempRankRoom = {}

	local rank = rankPlayerMatch

	for name, data in pairs(rank) do
		if data.matches >= 0 then
			if data.name ~= "" then
				tempRankRoom[#tempRankRoom + 1] = {
					name = name,
					color = data.color,
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
	end

	table.sort(tempRankRoom, function(a, b)
		return a.total > b.total
	end)

	return {
		name = tempRankRoom[1].name,
		total = tempRankRoom[1].total
	}
end
