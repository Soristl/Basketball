function stealBall(name, coordinatesX, coordinatesY)
	if (ballOwner == name) then return end

	local ballOwnerNickname = ballOwner
	local playerOwner = tfm.get.room.playerList[ballOwnerNickname]
	playerCanGetBall[name] = false

	canCatch = addTimer(
		function(i)
			if i == 1 then
				playerCanGetBall[name] = true
			end
		end,
		500,
		1,
		"canCatch"
	)

	if playerOwner == nil then return end

	if playerTeam[ballOwnerNickname].team == playerTeam[name].team then return end

	local playerX = playerOwner.x
	local playerY = playerOwner.y
	local playerVX = playerOwner.vx

	print("===")
	print("STEAL BALL " .. name)
	print(math.abs(coordinatesX - playerX))
	print(math.abs(coordinatesY - playerY))
	print("===")

	local isCorner = isCornerCourt(coordinatesX)

	local minX = 30
	local minY = 30

	if playerVX > 4 or playerVX < -4 then
		print("aq")
		minX = 50
		minY = 50
	end

	if isCorner then
		minX = 200
		minY = 200
	end

	print(minX)
	print(minY)

	if (math.abs(coordinatesX - playerX) <= minX and math.abs(
		coordinatesY - playerY
	) <= minY) then
		tfm.exec.removeImage(playerImage[ballOwner])
		tfm.exec.removeImage(playerArrowImage)
		system.bindKeyboard(ballOwner, 32, false, false)
		tfm.exec.removeImage(ballIdImage)
		removeTimer("chargeBallForce" .. playerLastShoot)
		removeTimer("chargeBallForce" .. ballOwner)
		canCatchBall = false
		playerForce[ballOwner] = 1
		ballOwner = name
		playerForce[ballOwner] = 1
		ballOwnerPressDown = false
		playerCanGetBall[ballOwner] = true
		playerLastShoot = name
		playerLastPass = ""
		setPlayerArrowImage(name)

		removeTimer("canCatchBall")
		removeTimer("bindSpace")

		addTimer(
			function(i)
				if i == 1 then
					canCatchBall = true
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
