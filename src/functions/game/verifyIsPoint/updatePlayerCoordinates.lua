function updateBallPlayerCoordinates()
	local player = tfm.get.room.playerList[ballOwner]

	if player == nil then return end

	local x = player.x + (player.vx * increaseXPlayer)
	local y = player.y + (player.vy * increaseYPlayer)

	player.x = x
	player.y = y
end
