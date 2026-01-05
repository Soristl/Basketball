function rankingUI(name)
	local rank = sortRankingData(name)
	local page = rankSettings[name].page

	local namesRank = ""
	local matchesRank = ""
	local winsRank = ""
	local winRatioRank = ""
	local defRank = ""
	local passesRank = ""
	local assistsRank = ""
	local d3Rank = ""
	local d2Rank = ""
	local pointsRank = ""
	local totalRank = ""
	local y = 137
	local colorBackground = 0x2d5a61
	local indexPositions = positionsString(rankSettings[name].page)

	ui.addWindow(24, "<p align='center'><font size='16px'>Room Ranking", name, 25, 60, 750, 300, 1, false, true, "<p align='center'><a href='event:closeRanking'>Close")

	for i = 9999559, 9999568 do
		local index = (i - 9999558) + (10 * (page - 1))

		print(rank[index])

		if rank[index] ~= nil then
			local winRatioString = tostring(rank[index].winRatio)
			ui.addTextArea(i, "", name, 35, y, 730, 6, colorBackground, colorBackground, 1, true)

			if page == 1 and index == 1 then
				namesRank = "" .. namesRank .. "<br>" .. indexPositions[(i - 9999558)] .. " <cs>" .. string.sub(rank[index].name, 1, #rank[index].name - 5) .. "<n><bl>" .. string.sub(rank[index].name, #rank[index].name - 4) .. "<n>"
			else
				namesRank = "" .. namesRank .. "<br>" .. indexPositions[(i - 9999558)] .. " " .. string.sub(rank[index].name, 1, #rank[index].name - 5) .. "<bl>" .. string.sub(rank[index].name, #rank[index].name - 4) .. "<n>"
			end
			matchesRank = "" .. matchesRank .. "<br>" .. rank[index].matches .. ""
			winsRank = "" .. winsRank .. "<br>" .. rank[index].wins .. ""
			winRatioRank = "" .. winRatioRank .. "<br>" .. string.sub(winRatioString, 1, 4) .. ""
			defRank = "" .. defRank .. "<br>" .. rank[index].def .. ""
			passesRank = "" .. passesRank .. "<br>" .. rank[index].passes .. ""
			assistsRank = "" .. assistsRank .. "<br>" .. rank[index].assists .. ""
			d3Rank = "" .. d3Rank .. "<br>" .. rank[index].d3 .. ""
			d2Rank = "" .. d2Rank .. "<br>" .. rank[index].d2 .. ""
			pointsRank = "" .. pointsRank .. "<br>" .. rank[index].points .. ""
			totalRank = "" .. totalRank .. "<br>" .. rank[index].total .. ""

			if colorBackground == 0x2d5a61 then
				colorBackground = 0x142b2e
			else
				colorBackground = 0x2d5a61
			end
		else
			ui.addTextArea(i, "", name, 35, y, 730, 6, colorBackground, colorBackground, 0, true)
		end

		y = y + 16
	end

	ui.addTextArea(9999548, "<textformat leading='3px'><j>Name<n>" .. namesRank .. "", name, 37, 115, 185, 185, 0x161616, 0x161616, 0, true)

	if rankSettings[name].sort == "matches" then
		ui.addTextArea(9999549, "<textformat leading='3px'><ce>Matches<n>" .. matchesRank .. "", name, 237, 115, 50, 185, 0x161616, 0x161616, 0, true)
	else
		ui.addTextArea(9999549, "<textformat leading='3px'><j><a href='event:setsortmatches'>Matches</a><n>" .. matchesRank .. "", name, 237, 115, 50, 185, 0x161616, 0x161616, 0, true)
	end

	if rankSettings[name].sort == "wins" then
		ui.addTextArea(9999550, "<textformat leading='3px'><ce>Wins<n>" .. winsRank .. "", name, 302, 115, 40, 185, 0x161616, 0x161616, 0, true)
	else
		ui.addTextArea(9999550, "<textformat leading='3px'><j><a href='event:setsortwins'>Wins</a><n>" .. winsRank .. "", name, 302, 115, 40, 185, 0x161616, 0x161616, 0, true)
	end

	if rankSettings[name].sort == "winRatio" then
		ui.addTextArea(9999551, "<textformat leading='3px'><ce>%W<n>" .. winRatioRank .. "", name, 355, 115, 35, 185, 0x161616, 0x161616, 0, true)
	else
		ui.addTextArea(9999551, "<textformat leading='3px'><j><a href='event:setsortwinRatio'>%W</a><n>" .. winRatioRank .. "", name, 355, 115, 35, 185, 0x161616, 0x161616, 0, true)
	end

	if rankSettings[name].sort == "def" then
		ui.addTextArea(9999552, "<textformat leading='3px'><ce>DEF<n>" .. defRank .. "", name, 402, 115, 30, 185, 0x161616, 0x161616, 0, true)
	else
		ui.addTextArea(9999552, "<textformat leading='3px'><j><a href='event:setsortdef'>DEF</a><n>" .. defRank .. "", name, 402, 115, 30, 185, 0x161616, 0x161616, 0, true)
	end

	if rankSettings[name].sort == "passes" then
		ui.addTextArea(9999553, "<textformat leading='3px'><ce>Passes<n>" .. passesRank .. "", name, 447, 115, 50, 185, 0x161616, 0x161616, 0, true)
	else
		ui.addTextArea(9999553, "<textformat leading='3px'><j><a href='event:setsortpasses'>Passes</a><n>" .. passesRank .. "", name, 447, 115, 50, 185, 0x161616, 0x161616, 0, true)
	end

	if rankSettings[name].sort == "assists" then
		ui.addTextArea(9999554, "<textformat leading='3px'><ce>Assists<n>" .. assistsRank .. "", name, 512, 115, 50, 185, 0x161616, 0x161616, 0, true)
	else
		ui.addTextArea(9999554, "<textformat leading='3px'><j><a href='event:setsortassists'>Assists</a><n>" .. assistsRank .. "", name, 512, 115, 50, 185, 0x161616, 0x161616, 0, true)
	end

	if rankSettings[name].sort == "d3" then
		ui.addTextArea(9999555, "<textformat leading='3px'><ce>D3<n>" .. d3Rank .. "", name, 577, 115, 30, 185, 0x161616, 0x161616, 0, true)
	else
		ui.addTextArea(9999555, "<textformat leading='3px'><j><a href='event:setsortd3'>D3</a><n>" .. d3Rank .. "", name, 577, 115, 30, 185, 0x161616, 0x161616, 0, true)
	end

	if rankSettings[name].sort == "d2" then
		ui.addTextArea(9999556, "<textformat leading='3px'><ce>D2<n>" .. d2Rank .. "", name, 622, 115, 30, 185, 0x161616, 0x161616, 0, true)
	else
		ui.addTextArea(9999556, "<textformat leading='3px'><j><a href='event:setsortd2'>D2</a><n>" .. d2Rank .. "", name, 622, 115, 30, 185, 0x161616, 0x161616, 0, true)
	end

	if rankSettings[name].sort == "points" then
		ui.addTextArea(9999557, "<textformat leading='3px'><ce>Points<n>" .. pointsRank .. "", name, 667, 115, 40, 185, 0x161616, 0x161616, 0, true)
	else
		ui.addTextArea(9999557, "<textformat leading='3px'><j><a href='event:setsortpoints'>Points</a><n>" .. pointsRank .. "", name, 667, 115, 40, 185, 0x161616, 0x161616, 0, true)
	end

	if rankSettings[name].sort == "total" then
		ui.addTextArea(9999558, "<textformat leading='3px'><ce>Total<n>" .. totalRank .. "", name, 722, 115, 40, 185, 0x161616, 0x161616, 0, true)
	else
		ui.addTextArea(9999558, "<textformat leading='3px'><j><a href='event:setsorttotal'>Total</a><n>" .. totalRank .. "", name, 722, 115, 40, 185, 0x161616, 0x161616, 0, true)
	end

	if page == 1 then
		buttonNextOrPrev(26, name, 25, 300, 200, 30, 1, "<p align='center'><n2>Previous</n>")
	else
		buttonNextOrPrev(26, name, 25, 300, 200, 30, 1, "<p align='center'><a href='event:prevRank" .. tostring(page - 1) .. "'>Previous</a/>")
	end

	if page == 3 then
		buttonNextOrPrev(25, name, 575, 300, 200, 30, 1, "<p align='center'><n2>Next</n>")
	else
		buttonNextOrPrev(25, name, 575, 300, 200, 30, 1, "<p align='center'><a href='event:nextRank" .. tostring(page + 1) .. "'>Next</a>")
	end
end
