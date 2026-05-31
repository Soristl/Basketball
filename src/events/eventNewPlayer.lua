function eventNewPlayer(name)
	tfm.exec.respawnPlayer(name)
	system.bindMouse(name, true)
	tfm.exec.setNameColor(name, 0x9292AA)

	playerDisableWall[name] = false
	playerDelayWall[name] = false
	playerCanGetBall[name] = true
	playersInGame[name] = false
	lastPlayerKey[name] = 0
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
	delayCountPass[name] = false
	playerPressSpace[name] = false
	rankingSelected[name] = "room"

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
	else
		--tfm.exec.addImage("img@19c1981123a", "?99", 10, -110, name, 0.98)
		ui.addTextArea(61, "<font size='16px'>", name, 5, 375, 400, 30, 0x3E2B20, 0x3E2B20, 1, true)
	end
end
