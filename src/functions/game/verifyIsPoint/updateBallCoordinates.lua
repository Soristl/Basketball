function updateBallCoordinates()
	local ballData = tfm.get.room.objectList[ball_id]

	if ballData == nil then return end

	local x = ballData.x + (ballData.vx * increaseXBall)
	local y = ballData.y + (ballData.vy * increaseYBall)

	if x <= 75 or x >= 1512 then return end

	ballData.x = x
	ballData.y = y
end
