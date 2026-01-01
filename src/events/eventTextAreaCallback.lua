function eventTextAreaCallback(id, name, c)
	if string.sub(c, 1, 11) == "joinTeamRed" and playersRed[tonumber(string.sub(c, 12))].name == "" and not playersInGame[name] then
		local index = tonumber(string.sub(c, 12))

		playersRed[index].name = name
		playerTeam[name] = {
			team = "red",
			index = index
		}
		playersInGame[name] = true

		ui.addTextArea(
			index,
			"<p align='center'><font size='15px'><a href='event:leaveTeamRed" .. index .. "'>" .. playersRed[index].name,
			nil,
			x[index],
			y[index],
			185,
			40,
			0x871F1F,
			0x871F1F,
			1,
			false
		)
	elseif string.sub(c, 1, 12) == "leaveTeamRed" and playersRed[tonumber(string.sub(c, 13))].name == name and playersInGame[name] then
		local index = tonumber(string.sub(c, 13))

		playersRed[index].name = ""
		playersInGame[name] = false
		playerTeam[name] = {
			team = "",
			index = 1
		}

		ui.addTextArea(
			index,
			"<p align='center'><font size='15px'><a href='event:joinTeamRed" .. index .. "'>Join",
			nil,
			x[index],
			y[index],
			185,
			40,
			0xE14747,
			0xE14747,
			1,
			false
		)
	elseif string.sub(c, 1, 12) == "joinTeamBlue" and playersBlue[tonumber(string.sub(c, 13))].name == "" and not playersInGame[name] then
		local index = tonumber(string.sub(c, 13))

		playersBlue[index].name = name
		playersInGame[name] = true
		playerTeam[name] = {
			team = "blue",
			index = index
		}

		ui.addTextArea(
			index + 6,
			"<p align='center'><font size='15px'><a href='event:leaveTeamBlue" .. index .. "'>" .. playersBlue[index].name,
			nil,
			x[index + 6],
			y[index + 6],
			185,
			40,
			0x0B3356,
			0x0B3356,
			1,
			false
		)
	elseif string.sub(c, 1, 13) == "leaveTeamBlue" and playersBlue[tonumber(string.sub(c, 14))].name == name and playersInGame[name] then
		local index = tonumber(string.sub(c, 14))

		playersBlue[index].name = ""
		playersInGame[name] = false
		playerTeam[name] = {
			team = "",
			index = 1
		}

		ui.addTextArea(
			index + 6,
			"<p align='center'><font size='15px'><a href='event:joinTeamBlue" .. index .. "'>Join",
			nil,
			x[index + 6],
			y[index + 6],
			185,
			40,
			0x184F81,
			0x184F81,
			1,
			false
		)
	end
end
