function showPlayerPoint(text, textComplement)
	ui.addTextArea(62, "<p align='center'><font size='18px'>", nil, 680, 78, 240, 30, 0x161616, 0x161616, 0, false)
	for i = 1, 3 do
		ui.removeTextArea(i, nil)
	end

	addTimer(
		function(i)
			if i == 1 then
				ui.updateTextArea(62, "<p align='center'><font size='18px'>")
			elseif i == 2 then
				ui.updateTextArea(62, "<p align='center'><font size='18px'>" .. text .. "")
			elseif i == 3 then
				ui.updateTextArea(62, "<p align='center'><font size='18px'>")
			elseif i == 4 then
				ui.updateTextArea(62, "<p align='center'><font size='18px'>" .. textComplement .. "")
			elseif i == 5 then
				ui.updateTextArea(62, "<p align='center'><font size='18px'>")
			elseif i == 6 then
				ui.updateTextArea(62, "<p align='center'><font size='18px'>" .. text .. "")
			elseif i == 7 then
				ui.updateTextArea(62, "<p align='center'><font size='18px'>")
			elseif i == 8 then
				ui.updateTextArea(62, "<p align='center'><font size='18px'>" .. textComplement .. "")
			elseif i == 10 then
				ui.updateTextArea(62, "<p align='center'><font size='18px'>")
			elseif i == 11 then
				ui.updateTextArea(62, "<p align='center'><font size='18px'>" .. text .. "")
			elseif i == 12 then
				ui.removeTextArea(62, nil)
				showTheScore()
			end
		end,
		500,
		12
	)
end
