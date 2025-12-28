function eventNewPlayer(name)
	for i = 1, #keys do
		if keys[i] == 32 then
			system.bindKeyboard(name, keys[i], true, true)
			system.bindKeyboard(name, keys[i], false, true)
		else
			system.bindKeyboard(name, keys[i], true, true)
		end
	end

	tfm.exec.respawnPlayer(name)
	system.bindMouse(name, true)
	tfm.exec.setNameColor(name, 0x9292AA)

	playerDisableWall[name] = false
	playerDelayWall[name] = false
	playerCanGetBall[name] = true
	playersInGame[name] = false
	playerTeam[name] = {
		team = "",
		index = 1
	}
	isPlayerDirectionRight[name] = true
	playerForce[name] = 1
	playerImage[name] = 99999

	if mode == "lobby" then
		showLobbyTextAreas(name)
	end
end
