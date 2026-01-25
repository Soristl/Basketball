function getBall(name, coordinatesX, coordinatesY)
	local ballStats = tfm.get.room.objectList[ball_id]
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

	if ballStats == nil then return end

	local x = ballStats.x
	local y = ballStats.y

	local xIncrease = ballStats.x + (ballStats.vx * increaseXBall)

	if coordinatesX >= 1429 or coordinatesX <= 170 then
		if coordinatesY <= 200 then return end
	end

	if xIncrease <= 175 or xIncrease >= 1412 then
		if y <= 150 and y >= 128 then return end
	end

	print("=====")
	print("GET BALL " .. name)
	print(math.abs(coordinatesX - x))
	print(math.abs(coordinatesY - y))
	print("=====")

	if (math.abs(coordinatesX - x) <= 80 and math.abs(coordinatesY - y) <= 80) then
		tfm.exec.removeObject(ball_id)
		ball_id = nil
		playerForce[ballOwner] = 0
		ballOwner = name
		playerForce[ballOwner] = 0
		playerPressSpace[ballOwner] = false
		removeTimer("chargeBallForce" .. playerLastShoot)
		ballOwnerPressDown = false
		-- canCatchBall = false
		playerCanGetBall[ballOwner] = true
		playerLastShoot = name
		playerLastPass = ""
		removeTimer("chargeBallForce" .. name)
		removeTimer("bindSpace")
		removeTimer("canCatchBall")

		setPlayerArrowImage(name)

		-- addTimer(function(i)
		--     if i == 1 then
		--         canCatchBall = true
		--     end
		-- end, 500, 1, "canCatchBall")

		system.bindKeyboard(name, 32, false, true)

		showImageBallWithPlayer(name)

		print("pegou")
	end
end
