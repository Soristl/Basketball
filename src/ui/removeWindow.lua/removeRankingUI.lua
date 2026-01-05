function removeRankingUI(name)
	closeWindow(24, name)

	for i = 9999548, 9999568 do
		ui.removeTextArea(i, name)
	end

	removeButtons(25, name)
	removeButtons(26, name)
end
