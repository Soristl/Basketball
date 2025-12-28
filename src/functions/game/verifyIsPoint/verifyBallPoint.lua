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

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "red" then
									tfm.exec.setPlayerScore(
										playerLastPass,
										1,
										true
									)
								end
							end
						end
					else
						redScore = redScore + 2

						if playerTeam[playerLastShoot].team == "red" then
							tfm.exec.setPlayerScore(playerLastShoot, 2, true)

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "red" then
									tfm.exec.setPlayerScore(
										playerLastPass,
										1,
										true
									)
								end
							end
						end
					end

					if redScore < winscore then
						tfm.exec.moveObject(ball_id, 54, 218, false, 0, 0, true)
					else
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

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "blue" then
									tfm.exec.setPlayerScore(
										playerLastPass,
										1,
										true
									)
								end
							end
						end
					else
						blueScore = blueScore + 2

						if playerTeam[playerLastShoot].team == "blue" then
							tfm.exec.setPlayerScore(playerLastShoot, 2, true)

							if playerLastPass ~= "" then
								if playerTeam[playerLastPass].team == "blue" then
									tfm.exec.setPlayerScore(
										playerLastPass,
										1,
										true
									)
								end
							end
						end
					end

					if blueScore < winscore then
						tfm.exec.moveObject(
							ball_id,
							1534,
							218,
							false,
							0,
							0,
							true
						)
					else
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
