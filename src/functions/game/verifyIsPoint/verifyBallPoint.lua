function verifyBallPoint()
	addTimer(
		function(i)
			if not disableVerifyBall then
				local ballCoords = tfm.get.room.objectList[ball_id]
				local text = ""
				local textComplement = ""

				if ballCoords == nil then return end

				local x = ballCoords.x
				local y = ballCoords.y

				if x <= 75 and y <= 150 and y >= 128 then
					if lastBallCoordX >= 482 then
						redScore = redScore + 3
						ui.updateTextArea(61, "<font size='16px'>The <r>Red<n> team scored!", nil)

						print("É PONTO")
						print(playerTeam[playerLastShoot].team)
						print("===")

						if playerTeam[playerLastShoot].team == "red" then
							tfm.exec.setPlayerScore(playerLastShoot, 3, true)
							rankPlayer[playerLastShoot].d3 = rankPlayer[playerLastShoot].d3 + 3
							rankPlayerMatch[playerLastShoot].d3 = rankPlayerMatch[playerLastShoot].d3 + 3
							text = "<r>" .. string.sub(playerLastShoot, 1, #playerLastShoot - 5) .. "<n> <j>scored<n> <v>+3<n>"

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "red" then
									tfm.exec.setPlayerScore(playerLastPass, 1, true)
									rankPlayer[playerLastPass].assists = rankPlayer[playerLastPass].assists + 1
									rankPlayerMatch[playerLastPass].assists = rankPlayerMatch[playerLastPass].assists + 1
									textComplement = "<r>" .. string.sub(playerLastPass, 1, #playerLastPass - 5) .. " <n><j>with the assist<n>"
								end
							end
						end
					else
						redScore = redScore + 2
						ui.updateTextArea(61, "<font size='16px'>The <r>Red<n> team scored!", nil)

						if playerTeam[playerLastShoot].team == "red" then
							tfm.exec.setPlayerScore(playerLastShoot, 2, true)
							rankPlayer[playerLastShoot].d2 = rankPlayer[playerLastShoot].d2 + 2
							rankPlayerMatch[playerLastShoot].d2 = rankPlayerMatch[playerLastShoot].d2 + 2
							text = "<r>" .. string.sub(playerLastShoot, 1, #playerLastShoot - 5) .. "<n> <j>scored<n> <v>+2<n>"

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "red" then
									tfm.exec.setPlayerScore(playerLastPass, 1, true)
									rankPlayer[playerLastPass].assists = rankPlayer[playerLastPass].assists + 1
									rankPlayerMatch[playerLastPass].assists = rankPlayerMatch[playerLastPass].assists + 1
									textComplement = "<r>" .. string.sub(playerLastPass, 1, #playerLastPass - 5) .. " <n><j>with the assist<n>"
								end
							end
						end
					end

					if redScore < winscore then
						tfm.exec.moveObject(ball_id, 54, 218, false, 0, 0, true)
					else
						for i = 1, #playersRed do
							if playersRed[i].name ~= "" then
								rankPlayer[playersRed[i].name].wins = rankPlayer[playersRed[i].name].wins + 1
								rankPlayerMatch[playersRed[i].name].wins = rankPlayerMatch[playersRed[i].name].wins + 1
							end
						end
						text = "<r>Red<n> <j>won!<n> <r>" .. tostring(redScore) .. "<n> <g>|<n> <bv>" .. tostring(blueScore) .. "<n>"
						local playerMVP = foundMVP()
						textComplement = "<font size='14px'><vp>MVP<n> <j>" .. playerMVP.name .. "<n> <vp>(Total " .. playerMVP.total .. ")"

						tfm.exec.removeObject(ball_id)
						timerEnd = os.time() + 7000
						mode = "end"
						removeTimer("loop")
					end

					disableVerifyBall = true

					addTimer(
						function(i)
							disableVerifyBall = false
						end,
						1000,
						1
					)

					teleportPlayers()

					if text == "" then
						text = "<bv>" .. string.sub(playerLastShoot, 1, #playerLastShoot - 5) .. " scored own goal<n>"
					end

					if textComplement == "" then
						textComplement = text
					end

					showPlayerPoint(text, textComplement)
				elseif x >= 1512 and y <= 150 and y >= 128 then
					if lastBallCoordX <= 1114 then
						blueScore = blueScore + 3
						ui.updateTextArea(61, "<font size='16px'>The <bv>Blue<n> team scored!", nil)

						if playerTeam[playerLastShoot].team == "blue" then
							tfm.exec.setPlayerScore(playerLastShoot, 3, true)
							rankPlayer[playerLastShoot].d3 = rankPlayer[playerLastShoot].d3 + 3
							rankPlayerMatch[playerLastShoot].d3 = rankPlayerMatch[playerLastShoot].d3 + 3
							text = "<bv>" .. string.sub(playerLastShoot, 1, #playerLastShoot - 5) .. "<n> <j>scored<n> <v>+3<n>"

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "blue" then
									tfm.exec.setPlayerScore(playerLastPass, 1, true)
									rankPlayer[playerLastPass].assists = rankPlayer[playerLastPass].assists + 1
									rankPlayerMatch[playerLastPass].assists = rankPlayerMatch[playerLastPass].assists + 1
									textComplement = "<bv>" .. string.sub(playerLastPass, 1, #playerLastPass - 5) .. " <n><j>with the assist<n>"
								end
							end
						end
					else
						blueScore = blueScore + 2
						ui.updateTextArea(61, "<font size='16px'>The <bv>Blue<n> team scored!", nil)

						if playerTeam[playerLastShoot].team == "blue" then
							tfm.exec.setPlayerScore(playerLastShoot, 2, true)
							rankPlayer[playerLastShoot].d2 = rankPlayer[playerLastShoot].d2 + 2
							rankPlayerMatch[playerLastShoot].d2 = rankPlayerMatch[playerLastShoot].d2 + 2
							text = "<bv>" .. string.sub(playerLastShoot, 1, #playerLastShoot - 5) .. "<n> <j>scored<n> <v>+2<n>"

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "blue" then
									tfm.exec.setPlayerScore(playerLastPass, 1, true)
									rankPlayer[playerLastPass].assists = rankPlayer[playerLastPass].assists + 1
									rankPlayerMatch[playerLastPass].assists = rankPlayerMatch[playerLastPass].assists + 1
									textComplement = "<bv>" .. string.sub(playerLastPass, 1, #playerLastPass - 5) .. " <n><j>with the assist<n>"
								end
							end
						end
					end

					if blueScore < winscore then
						tfm.exec.moveObject(ball_id, 1534, 218, false, 0, 0, true)
					else
						for i = 1, #playersBlue do
							if playersBlue[i].name ~= "" then
								rankPlayer[playersBlue[i].name].wins = rankPlayer[playersBlue[i].name].wins + 1
								rankPlayerMatch[playersBlue[i].name].wins = rankPlayerMatch[playersBlue[i].name].wins + 1
							end
						end
						text = "<bv>Blue<n> <j>won!<n> <r>" .. tostring(redScore) .. "<n> <g>|<n> <bv>" .. tostring(blueScore) .. "<n>"
						local playerMVP = foundMVP()
						textComplement = "<font size='14px'><vp>MVP<n> <j>" .. playerMVP.name .. "<n> <vp>(Total " .. playerMVP.total .. ")"

						tfm.exec.removeObject(ball_id)
						timerEnd = os.time() + 7000
						mode = "end"
						removeTimer("loop")
					end

					disableVerifyBall = true

					addTimer(
						function(i)
							disableVerifyBall = false
						end,
						1000,
						1
					)

					teleportPlayers()

					if textComplement == "" then
						textComplement = text
					end

					if text == "" then
						text = "<r>" .. string.sub(playerLastShoot, 1, #playerLastShoot - 5) .. " scored own goal<n>"
					end

					showPlayerPoint(text, textComplement)
				end
			end
		end,
		500,
		0,
		"loop"
	)
end
