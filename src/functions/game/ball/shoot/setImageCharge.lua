function setImageCharge(name, force)
	local playerStats = tfm.get.room.playerList[name]

	if force <= 1 then
		ui.updateTextArea(60, "<j>[<n><font color='#465a6e'>——————</font><j>]<n>", name)
		ui.updateTextArea(59, "<j>[<n><vp>—<n>", name)
	elseif force == 2 then
		ui.updateTextArea(59, "<j>[<n><vp>——<n>", name)
	elseif force == 3 then
		ui.updateTextArea(59, "<j>[<n><vp>———<n>", name)
	elseif force == 4 then
		ui.updateTextArea(59, "<j>[<n><vp>———<n><v>—<n>", name)
	elseif force == 5 then
		ui.updateTextArea(59, "<j>[<n><vp>———<n><v>——<n>", name)
	elseif force >= 6 then
		if force == 6 then
			ui.updateTextArea(59, "<j>[<n><vp>———<n><v>——<n><j>—<n>", name)

			return
		end
		ui.updateTextArea(60, "<j>[<n><font color='#465a6e'>————————</font><j>]<n>", name)
		ui.updateTextArea(59, "<j>[<n><vp>———<n><v>——<n><j>—<n><j>——<n>", name)
	end
end
