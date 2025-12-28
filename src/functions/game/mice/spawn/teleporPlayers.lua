function teleportPlayers()
	for name, data in pairs(tfm.get.room.playerList) do
		if playerTeam[name].team == "red" then
			local x = math.random(900, 1400)
			tfm.exec.movePlayer(name, x, 280)
			tfm.exec.setNameColor(name, 0xE14747)
		elseif playerTeam[name].team == "blue" then
			local x = math.random(155, 600)
			tfm.exec.movePlayer(name, x, 280)
			tfm.exec.setNameColor(name, 0x184F81)
		end
	end
end
