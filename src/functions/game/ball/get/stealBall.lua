function stealBall(name, coordinatesX, coordinatesY)
	if (ballOwner == name) then return end

	local ballOwnerNickname = ballOwner
	local playerOwner = tfm.get.room.playerList[ballOwnerNickname]

	local delay = 500

	local countPlayers = calculatePlayersOnArea(ballOwnerNickname)

	if countPlayers == 0 or countPlayers == 1 then
		delay = 500
	elseif countPlayers == 2 then
		delay = 1000
	elseif countPlayers >= 3 then
		delay = 1500
	end

	print("===")
	print("DELAY PARA PEGAR DENOVO")
	print(delay)
	print("===")

	removeTimer("canCatch" .. name .. "")

	canCatch = addTimer(
		function(i)
			if i == 1 then
				playerCanGetBall[name] = true
			end
		end,
		delay,
		1,
		"canCatch" .. name .. ""
	)

	if playerCanGetBall[name] then
		playerCanGetBall[name] = false
	else
		return
	end

	if playerOwner == nil then return end

	if playerTeam[ballOwnerNickname].team == playerTeam[name].team then return end

	local playerX = playerOwner.x
	local playerY = playerOwner.y
	local playerVX = playerOwner.vx

	print("===")
	print("STEAL BALL " .. name)
	print(math.abs(coordinatesX - playerX))
	print(math.abs(coordinatesY - playerY))
	print(canCatchBall)
	print("===")

	local isCorner = isCornerCourt(coordinatesX)

	local minX = 45
	local minY = 30

	if not canCatchBall then return end

	-- if lastPlayerKey[name] == lastPlayerKey[ballOwner] then
	-- 	minX = 85
	-- end

	-- if playerVX > 4 or playerVX < -4 then
	-- 	print("aq")
	-- 	minX = 50
	-- 	minY = 50
	-- end

	if isCorner and coordinatesY <= 205 and playerOwner.y <= 205 then
		minX = 200
		minY = 200
	end

	print(minX)
	print(minY)

	if (math.abs(coordinatesX - playerX) <= minX and math.abs(coordinatesY - playerY) <= minY) then
		ui.removeTextArea(58, ballOwner)
		ui.removeTextArea(59, ballOwner)
		ui.removeTextArea(60, ballOwner)
		tfm.exec.removeImage(playerArrowImage)
		tfm.exec.removeImage(ballIdImage)
		canCatchBall = false
		timerCanCatchBall = true
		playerForce[ballOwner] = 0
		ballOwner = name
		playerForce[ballOwner] = 0
		playerCanGetBall[ballOwner] = true
		playerLastShoot = name
		playerLastPass = ""
		setPlayerArrowImage(name)
		rankPlayer[name].def = rankPlayer[name].def + 1
		rankPlayerMatch[name].def = rankPlayerMatch[name].def + 1

		addTimer(
			function(i)
				if i == 1 then
					canCatchBall = true
					timerCanCatchBall = false
				end
			end,
			3000,
			1,
			"canCatchBall"
		)

		system.bindKeyboard(name, 32, false, true)

		showImageBallWithPlayer(name)

		print("pegou")
	end
end
