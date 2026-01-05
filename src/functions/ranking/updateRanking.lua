function updateRanking()
	local tempRankRoom = {}

	for name, data in pairs(rankPlayer) do
		if data.matches > 0 then
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

	rankRoom = tempRankRoom
end
