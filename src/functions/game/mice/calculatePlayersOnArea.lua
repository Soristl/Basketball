function calculatePlayersOnArea(name)
	local playerStats = tfm.get.room.playerList[name]

	if playerStats == nil then
		return 1
	end

	local countPlayers = 0
	local x = playerStats.x + playerStats.vx
	local minX = x - 150
	local maxX = x + 150

	if playerTeam[name].team == "red" then
		for i = 1, #playersBlue do
			local playerName = playersBlue[i].name

			if playerName ~= "" then
				local player = tfm.get.room.playerList[playerName]

				if player ~= nil then
					local playerCoordinatesX = player.x + player.vx

					if playerCoordinatesX >= minX and playerCoordinatesX <= maxX then
						countPlayers = countPlayers + 1
					end
				end
			end
		end
	elseif playerTeam[name].team == "blue" then
		for i = 1, #playersRed do
			local playerName = playersRed[i].name

			if playerName ~= "" then
				local player = tfm.get.room.playerList[playerName]

				if player ~= nil then
					local playerCoordinatesX = player.x + player.vx

					if playerCoordinatesX >= minX and playerCoordinatesX <= maxX then
						countPlayers = countPlayers + 1
					end
				end
			end
		end
	end

	return countPlayers
end
