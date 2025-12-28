function setPlayerArrowImage(name)
	if playerTeam[name].team == "red" then
		playerArrowImage =
			tfm.exec.addImage(
				"15296835cdd.png",
				"$" .. name,
				-20,
				-110,
				nil,
				1,
				1,
				_,
				1
			)
	else
		playerArrowImage =
			tfm.exec.addImage(
				"1529682cc1e.png",
				"$" .. name,
				-20,
				-110,
				nil,
				1,
				1,
				_,
				1
			)
	end
end
