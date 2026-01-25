function eventLoop()
	updateBallCoordinates()
	updateBallPlayerCoordinates()
	timersLoop()

	if mode == "lobby" and not gameStats.stopTimer then
		local x = math.ceil((lobbyTimer - os.time()) / 1000)
		local c = string.format("%d", x)

		ui.addTextArea(13, "<p align='center'><r>Game starting in " .. c .. "s", nil, 375, 300, 200, 20, 0x161616, 0x161616, 0, false)

		gameStats.stopTimerSeconds = x

		if x == 0 then
			local quantity = quantityPlayers()

			if quantity.red >= 0 and quantity.blue >= 0 then
				mode = "wait-start"

				startGame()
			else
				lobbyTimer = os.time() + 15000
			end
		end
	elseif mode == "game" then
		local name = ballOwner
		local playerStats = tfm.get.room.playerList[name]

		if name ~= "" then
			if playerPressSpace[name] then
				if playerForce[name] <= 6 then
					playerForce[name] = playerForce[name] + 1
				else
					playerForce[name] = 1
				end
				setImageCharge(name, playerForce[name])
			else
				tfm.exec.removeImage(playerImage[name])
				playerForce[name] = 0
			end
		end
	elseif mode == "end" then
		local x = math.ceil((timerEnd - os.time()) / 1000)
		local c = string.format("%d", x)

		if x == 0 then
			updateRanking()
			init()
		end
	end
end
