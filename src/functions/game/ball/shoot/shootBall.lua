function shootBall(name, x, y)
	print(t1)
	if t1 then
		playerForce[name] = 8
	end

	local timer = 1500

	if playerForce[name] >= 4 and playerForce[name] <= 5 then
		timer = 2000
	elseif playerForce[name] == 6 then
		timer = 2500
	end

	if playerForce[name] <= 1 then
		playerForce[name] = 0
		tfm.exec.removeImage(playerImage[name])

		-- system.bindKeyboard(name, 32, false, false)

		-- addTimer(
		-- 	function(i)
		-- 		system.bindKeyboard(name, 32, false, true)
		-- 		ballOwnerPressDown = false
		-- 	end,
		-- 	500,
		-- 	1,
		-- 	"chargeBallForce"
		-- )

		return
	elseif playerForce[name] == 2 then
		local vx = -2
		local vy = -3

		if x <= 274 or x >= 1330 then
			vy = -5
			vx = -3

			if isPlayerDirectionRight[name] then
				vx = 3
			end
		end

		if isPlayerDirectionRight[name] then
			vx = 2
		end

		if x <= 274 and isPlayerDirectionRight[name] then
			vy = -3
		elseif x >= 1330 and not isPlayerDirectionRight[name] then
			vy = -3
		end

		ball_id = tfm.exec.addShamanObject(17, x, y, 0, 0, 0, true)
		tfm.exec.moveObject(ball_id, 0, 0, true, vx, vy, true, 0, true)
	elseif playerForce[name] == 3 then
		local vx = -4
		local vy = -6

		if x <= 274 or x >= 1327 then
			vy = -8
		end

		if isPlayerDirectionRight[name] then
			vx = 4
		end

		if x <= 274 and isPlayerDirectionRight[name] then
			vy = -6
		elseif x >= 1330 and not isPlayerDirectionRight[name] then
			vy = -6
		end

		ball_id = tfm.exec.addShamanObject(17, x, y, 0, 0, 0, true)
		tfm.exec.moveObject(ball_id, 0, 0, true, vx, vy, true, 0, true)
	elseif playerForce[name] == 4 then
		local vx = -6
		local vy = -8

		if x <= 274 or x >= 1327 then
			vy = -10
		end

		if isPlayerDirectionRight[name] then
			vx = 6
		end

		if x <= 274 and isPlayerDirectionRight[name] then
			vy = -8
		elseif x >= 1330 and not isPlayerDirectionRight[name] then
			vy = -8
		end

		ball_id = tfm.exec.addShamanObject(17, x, y, 0, 0, 0, true)
		tfm.exec.moveObject(ball_id, 0, 0, true, vx, vy, true, 0, true)
	elseif playerForce[name] == 5 then
		local vx = -7.5
		local vy = -10

		if x <= 274 or x >= 1327 then
			vy = -13
		end

		if isPlayerDirectionRight[name] then
			vx = 7.5
		end

		if x <= 274 and isPlayerDirectionRight[name] then
			vy = -10
		elseif x >= 1330 and not isPlayerDirectionRight[name] then
			vy = -10
		end

		ball_id = tfm.exec.addShamanObject(17, x, y, 0, 0, 0, true)
		tfm.exec.moveObject(ball_id, 0, 0, true, vx, vy, true, 0, true)
	elseif playerForce[name] >= 6 then
		local vx = -9
		local vy = -12

		if x <= 274 or x >= 1327 then
			vy = -16
		end

		if isPlayerDirectionRight[name] then
			vx = 9
		end

		if x <= 274 and isPlayerDirectionRight[name] then
			vy = -12
		elseif x >= 1330 and not isPlayerDirectionRight[name] then
			vy = -12
		end

		ball_id = tfm.exec.addShamanObject(17, x, y, 0, 0, 0, true)
		tfm.exec.moveObject(ball_id, 0, 0, true, vx, vy, true, 0, true)
	end

	canCatchBall = false

	tfm.exec.removeImage(playerImage[name])
	tfm.exec.removeImage(playerArrowImage)
	playerLastShoot = name
	lastBallCoordX = x
	tfm.exec.removeImage(ballIdImage)
	playerForce[name] = 0
	removeTimer("chargeBallForce" .. name)
	removeTimer("canCatchBall")
	ballOwner = ""
	tfm.exec.addImage("17bd8be9691.png", "#" .. ball_id, -15, -15, nil, 1, 1)

	addTimer(
		function(i)
			if i == 1 then
				canCatchBall = true
			end
		end,
		timer,
		1,
		"canCatchBall"
	)
end
