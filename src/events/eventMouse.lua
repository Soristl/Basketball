function eventMouse(name, x, y)
	local playerX = tfm.get.room.playerList[name].x

	if math.abs(x - playerX) > 580 then return end

	print("===")
	print("EVENT MOUSE")
	print(name)
	print("X: " .. tostring(x))
	print("Y: " .. tostring(y))
	print("===")

	if mode == "game" then
		local playerSelected = ""
		local minX = 9999999
		if ballOwner == name then
			if playerTeam[name].team == "red" then
				for i = 1, #playersRed do
					if playersRed[i].name ~= name then
						local playerStats = tfm.get.room.playerList[playersRed[i].name]

						if playerStats ~= nil then
							local xPlayer = playerStats.x + (playerStats.vx * 5)
							local yPlayer = playerStats.y + (playerStats.vy * 5)

							print("===")
							print("PLAYER STATS " .. playersRed[i].name)
							print(xPlayer)
							print(yPlayer)

							print(math.abs(x - xPlayer))
							print(math.abs(y - yPlayer))
							print("===")

							if math.abs(x - xPlayer) <= 100 and math.abs(y - yPlayer) <= 100 then
								if minX == 9999999 then
									minX = xPlayer
									playerSelected = playersRed[i].name
								elseif xPlayer < minX then
									minX = xPlayer
									playerSelected = playersRed[i].name
								end
							end
						end
					end

					if playerSelected ~= "" then
						tfm.exec.removeImage(playerImage[name])
						system.bindKeyboard(name, 32, false, false)
						if not delayCountPass[name] then
							rankPlayer[name].passes = rankPlayer[name].passes + 1

							delayCountPass[name] = true

							addTimer(
								function(i)
									delayCountPass[name] = false
								end,
								500,
								1
							)
						end

						tfm.exec.removeImage(ballIdImage)
						removeTimer("chargeBallForce" .. name)
						removeTimer("canCatchBall")
						removeTimer("bindSpace")
						tfm.exec.removeImage(playerArrowImage)

						setPlayerArrowImage(playerSelected)

						ballOwner = playerSelected
						playerForce[playerSelected] = 1
						ballOwnerPressDown = false
						canCatchBall = false
						playerLastPass = name

						addTimer(
							function(i)
								canCatchBall = true
							end,
							2000,
							1,
							"canCatchBall"
						)

						addTimer(
							function(i)
								system.bindKeyboard(playerSelected, 32, false, true)
							end,
							500,
							1,
							"bindSpace"
						)

						showImageBallWithPlayer(playerSelected)
					end
				end
			elseif playerTeam[name].team == "blue" then
				for i = 1, #playersBlue do
					if playersBlue[i].name ~= name then
						local playerStats = tfm.get.room.playerList[playersBlue[i].name]

						if playerStats ~= nil then
							local xPlayer = playerStats.x + (playerStats.vx * 5)
							local yPlayer = playerStats.y + (playerStats.vy * 5)

							print("===")
							print("PLAYER STATS " .. playersBlue[i].name)
							print(xPlayer)
							print(yPlayer)

							print(math.abs(x - xPlayer))
							print(math.abs(y - yPlayer))
							print("===")

							if math.abs(x - xPlayer) <= 100 and math.abs(y - yPlayer) <= 100 then
								if minX == 9999999 then
									minX = xPlayer
									playerSelected = playersBlue[i].name
								elseif xPlayer < minX then
									minX = xPlayer
									playerSelected = playersBlue[i].name
								end
							end
						end
					end

					if playerSelected ~= "" then
						tfm.exec.removeImage(playerImage[name])
						system.bindKeyboard(name, 32, false, false)
						if not delayCountPass[name] then
							rankPlayer[name].passes = rankPlayer[name].passes + 1

							delayCountPass[name] = true

							addTimer(
								function(i)
									delayCountPass[name] = false
								end,
								500,
								1
							)
						end
						tfm.exec.removeImage(ballIdImage)
						removeTimer("chargeBallForce" .. name)
						removeTimer("canCatchBall")
						removeTimer("bindSpace")

						tfm.exec.removeImage(playerArrowImage)

						setPlayerArrowImage(playerSelected)

						ballOwner = playerSelected
						playerForce[playerSelected] = 1
						ballOwnerPressDown = false
						canCatchBall = false
						playerLastPass = name

						addTimer(
							function(i)
								canCatchBall = true
							end,
							2000,
							1,
							"canCatchBall"
						)

						addTimer(
							function(i)
								system.bindKeyboard(playerSelected, 32, false, true)
							end,
							1000,
							1,
							"bindSpace"
						)

						showImageBallWithPlayer(playerSelected)
					end
				end
			end
		end
	end
end
