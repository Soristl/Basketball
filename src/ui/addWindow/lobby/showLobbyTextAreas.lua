function showLobbyTextAreas(name)
	ui.addTextArea(
		0,
		"<p align='center'><font size='25px'>Teams",
		name,
		50,
		260,
		840,
		270,
		0xc191c,
		0x8a583c,
		1,
		false
	)

	for i = 1, #playersRed do
		if playersRed[i].name == "" then
			ui.addTextArea(
				i,
				"<p align='center'><font size='15px'><a href='event:" .. "joinTeamRed" .. tostring(
					i
				) .. "'>Join",
				name,
				x[i],
				y[i],
				185,
				40,
				0xE14747,
				0xE14747,
				1,
				false
			)
		else
			ui.addTextArea(
				i,
				"<p align='center'><font size='15px'><a href='event:leaveTeamRed" .. i .. "'>" .. playersRed[i].name,
				name,
				x[i],
				y[i],
				185,
				40,
				0x871F1F,
				0x871F1F,
				1,
				false
			)
		end
	end

	for i = 1, #playersBlue do
		if playersBlue[i].name == "" then
			ui.addTextArea(
				i + 6,
				"<p align='center'><font size='15px'><a href='event:joinTeamBlue" .. i .. "'>Join",
				name,
				x[i + 6],
				y[i + 6],
				185,
				40,
				0x184F81,
				0x184F81,
				1,
				false
			)
		else
			ui.addTextArea(
				i + 6,
				"<p align='center'><font size='15px'><a href='event:leaveTeamBlue" .. i .. "'>" .. playersBlue[i].name,
				name,
				x[i + 6],
				y[i + 6],
				185,
				40,
				0x0B3356,
				0x0B3356,
				1,
				false
			)
		end
	end
end
