function showImageBallWithPlayer(name)
	if isPlayerDirectionRight[name] then
		tfm.exec.removeImage(ballIdImage)
		ballIdImage =
			tfm.exec.addImage(
				"17bd8be9691.png",
				"$" .. name,
				10,
				-25,
				nil,
				1,
				1,
				_,
				1
			)
	else
		tfm.exec.removeImage(ballIdImage)
		ballIdImage =
			tfm.exec.addImage(
				"17bd8be9691.png",
				"$" .. name,
				-40,
				-25,
				nil,
				1,
				1,
				_,
				1
			)
	end
end
