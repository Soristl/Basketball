function init()
	tfm.exec.newGame("@6068644")

	gameStats = {
		stopTimer = false,
		stopTimerSeconds = 15
	}

	playersRed = {
		[1] = { name = "" },
		[2] = { name = "" },
		[3] = { name = "" },
		[4] = { name = "" },
		[5] = { name = "" },
		[6] = { name = "" }
	}

	playersBlue = {
		[1] = { name = "" },
		[2] = { name = "" },
		[3] = { name = "" },
		[4] = { name = "" },
		[5] = { name = "" },
		[6] = { name = "" }
	}

	redScore = 0
	blueScore = 0
	winscore = 16

	for name, data in pairs(tfm.get.room.playerList) do
		for i = 1, #keys do
			if keys[i] == 32 then
				system.bindKeyboard(name, keys[i], true, true)
				system.bindKeyboard(name, keys[i], false, true)
			else
				system.bindKeyboard(name, keys[i], true, true)
			end
		end

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
		playerImage[name] = 999999
		tfm.exec.setNameColor(name, 0x9292AA)

		tfm.exec.setPlayerScore(name, 0, false)

		system.bindMouse(name, true)
	end

	ui.addTextArea(
		0,
		"<p align='center'><font size='25px'>Teams",
		nil,
		50,
		260,
		840,
		270,
		0xc191c,
		0x8a583c,
		1,
		false
	)

	for i = 1, #x do
		local event = "joinTeamRed" .. tostring(i) .. ""
		local color = 0xE14747

		if i > 6 then
			event = "joinTeamBlue" .. tostring(i - 6) .. ""
			color = 0x184F81
		end

		ui.addTextArea(
			i,
			"<p align='center'><font size='15px'><a href='event:" .. event .. "'>Join",
			nil,
			x[i],
			y[i],
			185,
			40,
			color,
			color,
			1,
			false
		)
	end

	lobbyTimer = os.time() + 15000

	mode = "lobby"
end

init()
