function chargeBallForce(name)
	removeTimer("chargeBallForce" .. name)

	local loops = 0
	addTimer(
		function(i)
			if not ballOwnerPressDown then
				tfm.exec.removeImage(playerImage[name])

				removeTimer("chargeBallForce" .. name)
				return
			end

			if loops == 0 then
				if i <= 2 then
					playerForce[name] = 2
				elseif i >= 3 and i <= 5 then
					playerForce[name] = i
				else
					playerForce[name] = 7
				end
			else
				if (i - (8 * loops)) >= 7 then
					playerForce[name] = 7
				elseif (i - (8 * loops)) >= 2 and (i - (8 * loops)) <= 3 then
					playerForce[name] = 2
				else
					if (i - (8 * loops)) == 1 then
						playerForce[name] = 1
					else
						playerForce[name] = (i - (8 * loops)) - 1
					end
				end
			end

			setImageCharge(name, playerForce[name])

			if (i - (8 * loops)) == 8 and ballOwnerPressDown and name == ballOwner then
				loops = loops + 1
			elseif (i - (8 * loops)) == 8 and name ~= ballOwner then
				playerForce[name] = 1
				tfm.exec.removeImage(playerImage[name])
			end
		end,
		500,
		0,
		"chargeBallForce" .. name
	)
end
