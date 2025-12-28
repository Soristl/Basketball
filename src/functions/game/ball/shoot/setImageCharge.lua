function setImageCharge(name, force)
	if force == 1 then
		tfm.exec.removeImage(playerImage[name])
		playerImage[name] =
			tfm.exec.addImage(
				"img@19afe940b7c",
				"$" .. name,
				-10,
				15,
				name,
				1,
				1,
				_,
				1
			)
	elseif force == 2 then
		tfm.exec.removeImage(playerImage[name])
		playerImage[name] =
			tfm.exec.addImage(
				"img@19afe9adeda",
				"$" .. name,
				-10,
				15,
				name,
				1,
				1,
				_,
				1
			)
	elseif force == 3 then
		tfm.exec.removeImage(playerImage[name])
		playerImage[name] =
			tfm.exec.addImage(
				"img@19afe9b12d0",
				"$" .. name,
				-10,
				15,
				name,
				1,
				1,
				_,
				1
			)
	elseif force == 4 then
		tfm.exec.removeImage(playerImage[name])
		playerImage[name] =
			tfm.exec.addImage(
				"img@19afe9b5b33",
				"$" .. name,
				-10,
				15,
				name,
				1,
				1,
				_,
				1
			)
	elseif force == 5 then
		tfm.exec.removeImage(playerImage[name])
		playerImage[name] =
			tfm.exec.addImage(
				"img@19afe9b947d",
				"$" .. name,
				-10,
				15,
				name,
				1,
				1,
				_,
				1
			)
	elseif force >= 7 then
		tfm.exec.removeImage(playerImage[name])
		playerImage[name] =
			tfm.exec.addImage(
				"img@19afe9bc468",
				"$" .. name,
				-10,
				15,
				name,
				1,
				1,
				_,
				1
			)
	end
end
