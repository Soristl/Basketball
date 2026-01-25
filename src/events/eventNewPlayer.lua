function eventNewPlayer(name)
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
	rankSettings[name] = {
		page = 1,
		sort = "total",
		open = false
	}
	isPlayerDirectionRight[name] = true
	playerForce[name] = 0
	playerImage[name] = 99999
	delayCountPass[name] = false
	playerPressSpace[name] = false

	if playerTeamHistory[name] == nil then
		playerTeamHistory[name] = {}
	end

	if rankPlayer[name] == nil then
		rankPlayer[name] = {
			name = name,
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
	end

	for i = 1, #keys do
		if keys[i] == 32 then
			system.bindKeyboard(name, keys[i], true, true)
			system.bindKeyboard(name, keys[i], false, true)
		else
			system.bindKeyboard(name, keys[i], true, true)
		end
	end

	if mode == "lobby" then
		showLobbyTextAreas(name)
	end
end
