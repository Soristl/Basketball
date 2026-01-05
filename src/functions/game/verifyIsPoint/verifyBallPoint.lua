function verifyBallPoint()
	addTimer(
		function(i)
			if not disableVerifyBall then
				local ballCoords = tfm.get.room.objectList[ball_id]

				if ballCoords == nil then return end

				local x = ballCoords.x
				local y = ballCoords.y

				if x <= 75 and y <= 150 and y >= 128 then
					if lastBallCoordX >= 482 then
						redScore = redScore + 3

						print("É PONTO")
						print(playerTeam[playerLastShoot].team)
						print("===")

						if playerTeam[playerLastShoot].team == "red" then
							tfm.exec.setPlayerScore(playerLastShoot, 3, true)
							rankPlayer[playerLastShoot].d3 = rankPlayer[playerLastShoot].d3 + 3

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "red" then
									tfm.exec.setPlayerScore(playerLastPass, 1, true)
									rankPlayer[playerLastPass].assists = rankPlayer[playerLastPass].assists + 1
								end
							end
						end
					else
						redScore = redScore + 2

						if playerTeam[playerLastShoot].team == "red" then
							tfm.exec.setPlayerScore(playerLastShoot, 2, true)
							rankPlayer[playerLastShoot].d2 = rankPlayer[playerLastShoot].d2 + 2

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "red" then
									tfm.exec.setPlayerScore(playerLastPass, 1, true)
									rankPlayer[playerLastPass].assists = rankPlayer[playerLastPass].assists + 1
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
							end
						end
						tfm.exec.removeObject(ball_id)
						timerEnd = os.time() + 5000
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
					showTheScore()
				elseif x >= 1512 and y <= 150 and y >= 128 then
					if lastBallCoordX <= 1114 then
						blueScore = blueScore + 3

						if playerTeam[playerLastShoot].team == "blue" then
							tfm.exec.setPlayerScore(playerLastShoot, 3, true)
							rankPlayer[playerLastShoot].d3 = rankPlayer[playerLastShoot].d3 + 3

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "blue" then
									tfm.exec.setPlayerScore(playerLastPass, 1, true)
									rankPlayer[playerLastPass].assists = rankPlayer[playerLastPass].assists + 1
								end
							end
						end
					else
						blueScore = blueScore + 2

						if playerTeam[playerLastShoot].team == "blue" then
							tfm.exec.setPlayerScore(playerLastShoot, 2, true)
							rankPlayer[playerLastShoot].d2 = rankPlayer[playerLastShoot].d2 + 2

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "blue" then
									tfm.exec.setPlayerScore(playerLastPass, 1, true)
									rankPlayer[playerLastPass].assists = rankPlayer[playerLastPass].assists + 1
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
							end
						end
						tfm.exec.removeObject(ball_id)
						timerEnd = os.time() + 5000
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
					showTheScore()
				end
			end
		end,
		500,
		0,
		"loop"
	)
end
