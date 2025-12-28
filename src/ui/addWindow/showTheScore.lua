function showTheScore()
	ui.addTextArea(
		1,
		"<p align='center'><font size='25px'><r>" .. tostring(redScore),
		nil,
		720,
		75,
		70,
		40,
		0x161616,
		0x161616,
		0,
		false
	)
	ui.addTextArea(
		2,
		"<p align='center'><font size='25px'><bv>" .. tostring(blueScore),
		nil,
		820,
		75,
		70,
		40,
		0x161616,
		0x161616,
		0,
		false
	)
	ui.addTextArea(3, "", nil, 800, 75, 10, 30, 0x161616, 0x161616, 1, false)
end
