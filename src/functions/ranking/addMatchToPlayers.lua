function addMatchToPlayers()
	for name, data in pairs(tfm.get.room.playerList) do
		local length = #playerTeamHistory[name]

		if playersInGame[name] then
			if playerTeam[name].team == "red" then
				playerTeamHistory[name][length + 1] = "red"
				rankPlayer[name].matches = rankPlayer[name].matches + 1
			elseif playerTeam[name].team == "blue" then
				playerTeamHistory[name][length + 1] = "blue"
				rankPlayer[name].matches = rankPlayer[name].matches + 1
			end
		end
	end
end
