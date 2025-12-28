function quantityPlayers()
	local playersRedCount = 0
	local playersBlueCount = 0

	for i = 1, #playersRed do
		if playersRed[i].name ~= "" then
			playersRedCount = playersRedCount + 1
		end
	end

	for i = 1, #playersBlue do
		if playersBlue[i].name ~= "" then
			playersBlueCount = playersBlueCount + 1
		end
	end

	local players = {
		red = playersRedCount,
		blue = playersBlueCount
	}

	return players
end
