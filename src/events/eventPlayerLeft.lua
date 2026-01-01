function eventPlayerLeft(name)
	if mode == "lobby" then
		if playerTeam[name].team == "red" then
			playersInGame[name] = false
			playersRed[playerTeam[name].index].name = ""
			ui.addTextArea(
				playerTeam[name].index,
				"<p align='center'><font size='15px'><a href='event:joinTeamRed" .. tostring(playerTeam[name].index) .. "'>Join",
				nil,
				x[playerTeam[name].index],
				y[playerTeam[name].index],
				185,
				40,
				0xE14747,
				0xE14747,
				1,
				false
			)

			playerTeam[name] = {
				team = "",
				index = 1
			}
		elseif playerTeam[name].team == "blue" then
			playersInGame[name] = false
			playersBlue[playerTeam[name].index].name = ""
			ui.addTextArea(
				playerTeam[name].index + 6,
				"<p align='center'><font size='15px'><a href='event:joinTeamBlue" .. tostring(playerTeam[name].index) .. "'>Join",
				nil,
				x[playerTeam[name].index + 6],
				y[playerTeam[name].index + 6],
				185,
				40,
				0x184F81,
				0x184F81,
				1,
				false
			)

			playerTeam[name] = {
				team = "",
				index = 1
			}
		end
	elseif mode == "game" then
		if playersInGame[name] then
			local playerValues = playerTeam[name]

			if playerValues.team == "red" then
				playersRed[playerValues.index].name = ""

				playerTeam[name] = {
					team = "",
					index = 1
				}
			elseif playerValues.team == "blue" then
				playersBlue[playerValues.index].name = ""

				playerTeam[name] = {
					team = "",
					index = 1
				}
			end

			playersInGame[name] = false

			if name == ballOwner then
				system.bindKeyboard(ballOwner, 32, false, false)
				ballOwner = ""
				lastBallCoordX = 0
				tfm.exec.removeImage(ballIdImage)
				playerForce[name] = 1
				removeTimer("chargeBallForce" .. name)
				removeTimer("canCatchBall")

				spawnInitialBall()
			end
		end
	end
end
