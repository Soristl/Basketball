tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.setRoomMaxPlayers(16)
system.disableChatCommandDisplay(nil, true)
tfm.exec.disableMortCommand(true)

local permanentAdmins = {
	["Refletz#6472"] = true,
	["Soristl1#0000"] = true
}

local admins = {
	["Refletz#6472"] = true,
	["Soristl1#0000"] = true
}

local x = { 70, 275, 70, 275, 70, 275, 480, 685, 480, 685, 480, 685 }
local y = { 340, 340, 400, 400, 460, 460, 340, 340, 400, 400, 460, 460 }
local playersInGame = {}

local playerDisableWall = {}
local playerDelayWall = {}
local playerCanGetBall = {}
local playerTeam = {}
local playerForce = {}
local playerImage = {}
local keys = { 0, 1, 2, 3, 32 }
local ballOwner = ""
local ballOwnerPressDown = false
local playerLastShoot = ""
local playerLastPass = ""
local canCatchBall = true
local ballIdImage = 0
local ballCanShoot = false
local playerArrowImage = 0
local lastBallCoordX = 0
local isPlayerDirectionRight = {}
local disableVerifyBall = false
local increaseXBall = 10
local increaseYBall = 5
local increaseXPlayer = 10
local increaseYPlayer = 5
