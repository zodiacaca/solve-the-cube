groupBox grp1 "" pos:[235,0] width:395 height:175

dropDownList ddl1 "" pos:[245,15] width:375 height:30
on ddl1 selected sel do
(
	local ori = storeTransformation opForm
	operateTransformation ddl1.selection
	visualizeAppearance ori opForm [0,-dCount*40,0] true
	dCount += 1
)
groupBox grp3 "" pos:[245,40] width:160 height:125
local bPosX = 255
local bPosY = 55
button btnT1 "T 90 (1)" pos:[bPosX,bPosY] width:60 height:30
on btnT1 pressed do
(
	local ori = storeTransformation opForm
	operateTransformation 1
	visualizeAppearance ori opForm [0,-dCount*40,0] true
	dCount += 1
)
button btnT2 "T 180 (2)" pos:[bPosX,bPosY+35] width:60 height:30
on btnT2 pressed do
(
	local ori = storeTransformation opForm
	operateTransformation 2
	visualizeAppearance ori opForm [0,-dCount*40,0] true
	dCount += 1
)
button btnT3 "T -90 (3)" pos:[bPosX,bPosY+35*2] width:60 height:30
on btnT3 pressed do
(
	local ori = storeTransformation opForm
	operateTransformation 3
	visualizeAppearance ori opForm [0,-dCount*40,0] true
	dCount += 1
)
button btnR1 "R 90 (4)" pos:[bPosX+80,bPosY] width:60 height:30
on btnR1 pressed do
(
	local ori = storeTransformation opForm
	operateTransformation 4
	visualizeAppearance ori opForm [0,-dCount*40,0] true
	dCount += 1
)
button btnR2 "R 180 (5)" pos:[bPosX+80,bPosY+35] width:60 height:30
on btnR2 pressed do
(
	local ori = storeTransformation opForm
	operateTransformation 5
	visualizeAppearance ori opForm [0,-dCount*40,0] true
	dCount += 1
)
button btnR3 "R -90 (6)" pos:[bPosX+80,bPosY+35*2] width:60 height:30
on btnR3 pressed do
(
	local ori = storeTransformation opForm
	operateTransformation 6
	visualizeAppearance ori opForm [0,-dCount*40,0] true
	dCount += 1
)