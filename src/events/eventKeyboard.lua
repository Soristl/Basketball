function eventKeyboard(name, key, down, x, y, xv, yv)
	local playerData = tfm.get.room.playerList[name]

	if name ~= ballOwner then
		ui.removeTextArea(58, name)
		ui.removeTextArea(59, name)
		ui.removeTextArea(60, name)
	end

	if playerData ~= nil then
		tfm.get.room.playerList[name].x = x + xv
		tfm.get.room.playerList[name].y = y + yv
		tfm.get.room.playerList[name].vx = xv
		tfm.get.room.playerList[name].vy = yv
	end

	if key == 76 then
		if rankSettings[name].open then
			rankSettings[name].open = false

			removeRankingUI(name)

			return
		end

		rankSettings[name].sort = "total"
		rankSettings[name].page = 1
		rankSettings[name].open = true
		rankingUI(name)
	end

	if mode == "game" and playersInGame[name] then
		local OffsetX = 0
		local OffsetY = 0

		if xv < 0 then
			OffsetX = -15
		elseif xv > 0 then
			OffsetX = 15
		end
		if yv < 0 then
			OffsetY = -5
		elseif yv > 0 then
			OffsetY = 5
		end

		local coordinatesX = (x + xv) + OffsetX
		local coordinatesY = (y + yv) + OffsetY

		if key == 0 or key == 1 or key == 2 or key == 3 then
			lastPlayerKey[name] = key
		end

		if key == 0 or key == 2 then
			if key == 0 then
				isPlayerDirectionRight[name] = false
			else
				isPlayerDirectionRight[name] = true
			end

			if ballOwner == name then
				if key == 0 then
					isFacingRight = false
					showImageBallWithPlayer(name)
				elseif key == 2 then
					isFacingRight = true
					showImageBallWithPlayer(name)
				end
			end
		end

		if key == 32 and down then
			playerPressSpace[name] = true

			if ballOwner == name then
				local textAreaX = 340

				if x < 350 then
					textAreaX = x
				end
				ui.addTextArea(58, "", name, textAreaX, 300, 120, 20, 0x465a6e, 0x71a3c1, 0.6, true)
				ui.addTextArea(59, "<j>[<n><vp>—<n>", name, textAreaX + 10, 302, 120, 20, 0x161616, 0x161616, 0, true)
				ui.addTextArea(60, "<font color='#465a6e'>[——————</font><j>]<n>", name, textAreaX + 10, 302, 120, 20, 0x161616, 0x161616, 0, true)
			end
		elseif key == 32 and not down then
			playerPressSpace[name] = false
		end

		if key == 32 and ballOwner ~= name and down then
			if ballOwner == "" and playerCanGetBall[name] then
				if canCatchBall then
					getBall(name, x, y)
				end
			else
				stealBall(name, x, y)
			end

			return
		end

		if key == 32 and ballOwner == name and not playerPressSpace[name] then
			ui.removeTextArea(58, name)
			ui.removeTextArea(59, name)
			ui.removeTextArea(60, name)

			shootBall(name, x, y)

			playerForce[name] = 0

			return
		end

		if key == 1 then
			if playerDisableWall[name] and not playerDelayWall[name] then
				local increaseJump = 0
				local vx = xv
				if x <= 216 or x >= 1384 then
					if x <= 226 then
						vx = -3.45
					else
						vx = 3.45
					end
					increaseJump = -75
				else
					increaseJump = -60
				end

				local vy = yv

				if yv >= 0 then
					vy = 0
				end

				tfm.exec.movePlayer(name, 0, 0, true, 0, increaseJump + vy, true)
				tfm.get.room.playerList[name].y = tfm.get.room.playerList[name].y + (increaseJump + vy)
				playerDelayWall[name] = true

				delayWall = addTimer(
					function(i)
						if i == 1 then
							playerDisableWall[name] = false
							playerDelayWall[name] = false
						end
					end,
					3500,
					1,
					"delayWall"
				)

				return
			end

			if not playerDisableWall[name] and not playerDelayWall[name] then
				playerDisableWall[name] = true

				disableWall = addTimer(
					function(i)
						if i == 1 then
							playerDisableWall[name] = false
						end
					end,
					1500,
					1,
					"disableWall"
				)

				return
			end
		end
	end
end
