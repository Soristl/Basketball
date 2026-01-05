function eventKeyboard(name, key, down, x, y, xv, yv)
	local playerData = tfm.get.room.playerList[name]

	if name ~= ballOwner then
		tfm.exec.removeImage(playerImage[name])
		removeTimer("chargeBallForce" .. name)
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

		if key == 32 and playerCanGetBall[name] and ballOwner ~= name and down and canCatchBall then
			if ballOwner == "" then
				getBall(name, x, y)
			else
				stealBall(name, x, y)
			end

			return
		end

		if key == 32 and ballOwner == name and ballOwnerPressDown and playerCanGetBall[name] and ballCanShoot then
			removeTimer("ballDown")
			ballOwnerPressDown = false
			system.bindKeyboard(name, 32, false, false)
			tfm.exec.removeImage(playerImage[name])

			shootBall(name, x, y)

			playerForce[name] = 1
			removeTimer("chargeBallForce" .. name)

			return
		end

		if key == 32 and ballOwner == name and not ballOwnerPressDown and down and playerCanGetBall[name] then
			removeTimer("ballDown")
			playerForce[name] = 1
			removeTimer("chargeBallForce" .. name)
			removeTimer("ballCanShoot")

			ballCanShoot = false

			addTimer(
				function(i)
					if i == 1 then
						ballCanShoot = true
					end
				end,
				1000,
				1,
				"ballCanShoot"
			)

			if ballOwner == name and not ballOwnerPressDown then
				ballOwnerPressDown = true
				playerForce[name] = 1
				removeTimer("chargeBallForce" .. name)
				chargeBallForce(name)
				tfm.exec.removeImage(playerImage[name])
			end

			return
		end

		if key == 32 and ballOwner == name and not down then
			removeTimer("ballDown")
			playerForce[name] = 1
			removeTimer("chargeBallForce" .. name)
			ballOwnerPressDown = false

			-- playerCanGetBall[name] = false

			-- removeTimer("canCatch"..name)

			-- canCatch = addTimer(function(i)
			--     if i == 1 then
			--         playerCanGetBall[name] = true
			--     end
			-- end, 500, 1, "canCatch"..name)

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
					increaseJump = -70
				else
					increaseJump = -60
				end

				local vy = yv

				if yv >= 0 then
					vy = 0
				end

				tfm.exec.movePlayer(name, 0, 0, true, 0 + vx, increaseJump + vy, true)
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
					3500,
					1,
					"disableWall"
				)

				return
			end
		end
	end
end
