function eventChatCommand(name, c)
	local command = string.lower(c)
	if mode == "lobby" then
		if string.sub(
			command,
			1,
			9
		) == "stoptimer" and permanentAdmins[name] then
			local args = split(command)

			if args[2] ~= "true" or args[2] ~= "false" then
				print("<bv>Invalid second parameter must be true or false<n>")
			end

			if args[2] == "true" then
				gameStats.stopTimer = true

				return
			end

			lobbyTimer = os.time() + (gameStats.stopTimerSeconds * 1000)
			gameStats.stopTimer = false
		elseif command == "skiptimer" and admins[name] then
			lobbyTimer = os.time() + 5000
		elseif command == "resettimer" and admins[name] then
			lobbyTimer = os.time() + 15000
		end
	elseif mode == "game" then
		if string.sub(command, 1, 2) == "fs" then
			local args = split(command)

			vx1 = tonumber(args[2])
			vy1 = tonumber(args[3])

			t1 = true
		elseif command == "px" then
			local x = tfm.get.room.playerList[name].x
			local y = tfm.get.room.playerList[name].y

			print("X: " .. tostring(x))
			print("Y: " .. tostring(y))
		elseif command == "ball" then
			local ballData = tfm.get.room.objectList[ball_id]

			if ballData == nil then return end

			local x = tfm.get.room.objectList[ball_id].x
			local y = tfm.get.room.objectList[ball_id].y

			print("===")
			print("BALL COORDS")
			print("X: " .. tostring(x))
			print("Y: " .. tostring(y))
			print("===")
		elseif string.sub(
			command,
			1,
			5
		) == "arrow" and permanentAdmins[name] then
			local args = split(command)

			if args[2] == nil then return end

			if args[2] == "true" then
				removeTimer("arrow")

				addTimer(
					function(i)
						local ballData = tfm.get.room.objectList[ball_id]
						local player = tfm.get.room.playerList[ballOwner]

						if ballOwner ~= "" then
							if player == nil then return end

							local x = player.x + (player.vx * increaseXPlayer)
							local y = player.y + (player.vy * increaseYPlayer)

							tfm.exec.addShamanObject(0, x, y, 0, 0, 0, true)
						else
							if ballData == nil then return end

							local x = ballData.x + (ballData.vx * increaseXBall)
							local y = ballData.y + (ballData.vy * increaseYBall)

							tfm.exec.addShamanObject(0, x, y, 0, 0, 0, true)
						end
					end,
					500,
					0,
					"arrow"
				)

				return
			end

			if args[2] == "false" then
				removeTimer("arrow")

				return
			end
		elseif command == "join" and not playersInGame[name] then
			local quantity = quantityPlayers()

			print(quantity.red)
			print(quantity.blue)

			if quantity.red > quantity.blue and quantity.blue ~= 6 then
				for i = 1, #playersBlue do
					if playersBlue[i].name == "" then
						playersBlue[i].name = name

						playersInGame[name] = true
						playerTeam[name] = {
							team = "blue",
							index = i
						}

						teleportPlayerToTeam(name)

						playerCanGetBall[name] = false

						canCatch = addTimer(
							function(i)
								if i == 1 then
									playerCanGetBall[name] = true
								end
							end,
							1500,
							1,
							"canCatch"
						)

						return
					end
				end
			elseif quantity.blue > quantity.red and quantity.red ~= 6 then
				for i = 1, #playersRed do
					if playersRed[i].name == "" then
						playersRed[i].name = name

						playersInGame[name] = true
						playerTeam[name] = {
							team = "red",
							index = i
						}

						teleportPlayerToTeam(name)

						playerCanGetBall[name] = false

						canCatch = addTimer(
							function(i)
								if i == 1 then
									playerCanGetBall[name] = true
								end
							end,
							1500,
							1,
							"canCatch"
						)

						return
					end
				end
			elseif quantity.red == quantity.blue and quantity.red ~= 6 then
				for i = 1, #playersRed do
					if playersRed[i].name == "" then
						playersRed[i].name = name

						playersInGame[name] = true
						playerTeam[name] = {
							team = "red",
							index = i
						}

						teleportPlayerToTeam(name)

						playerCanGetBall[name] = false

						canCatch = addTimer(
							function(i)
								if i == 1 then
									playerCanGetBall[name] = true
								end
							end,
							1500,
							1,
							"canCatch"
						)

						return
					end
				end
			end
		elseif command == "leave" and playersInGame[name] then
			local playerValues = playerTeam[name]
			local player = tfm.get.room.playerList[name]
			local x = player.x
			local y = player.y

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
			tfm.exec.setNameColor(name, 0x9292AA)
			tfm.exec.movePlayer(name, 800, 50)
			system.bindKeyboard(name, 32, false, false)

			if name == ballOwner then
				tfm.exec.removeImage(playerImage[ballOwner])
				system.bindKeyboard(ballOwner, 32, false, false)
				tfm.exec.removeImage(playerArrowImage)
				ballOwner = ""
				lastBallCoordX = x
				tfm.exec.removeImage(ballIdImage)
				playerForce[name] = 1
				removeTimer("chargeBallForce" .. name)
				removeTimer("canCatchBall")

				ball_id = tfm.exec.addShamanObject(17, x, y, 0, 0, 0, true)
			end
		elseif string.sub(command, 1, 8) == "winscore" and admins[name] then
			local args = split(command)

			local winscoreSet = tonumber(args[2])

			if type(winscoreSet) ~= "number" then return end

			winscore = math.abs(tonumber(args[2]))
		end
	end
end
