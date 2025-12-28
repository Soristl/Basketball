function spawnInitialBall()
	ball_id = tfm.exec.addShamanObject(17, 800, 200, 0, 0, 0, true)
	tfm.exec.addImage("17bd8be9691.png", "#" .. ball_id, -15, -15, nil, 1, 1)
end
