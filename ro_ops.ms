groupBox grp1 "" pos:[235,0] width:395 height:175

dropDownList ddl1 "" pos:[245,15] width:375 height:30
on ddl1 selected sel do
(
	local ori = storeTransformation opForm
	operateTransformation ddl1.selection
	visualizeAppearance ori opForm [0,-dCount*40,0] false
	dCount += 1
)
groupBox grp3 "" pos:[245,40] width:160 height:125
local bPosX = 255
local bPosY = 55
button btnT1 "T 90 (1)" pos:[bPosX,bPosY] width:60 height:30
on btnT1 pressed do
(
	local appear = initializeAppearance()
	local ori = storeTransformation form
	appear = applyTransformation appear transformation[1]
	local new_id = #()
	for i = 1 to id.count do
	(
		append new_id appear.Item[id[i]]
	)
	puzzleConfig.set_item "Start" new_id
	append ops 1
	visualizeAppearance ori appear [0,-(ops.count-1)*40,0] false
)
button btnT2 "T 180 (2)" pos:[bPosX,bPosY+35] width:60 height:30
on btnT2 pressed do
(
	local appear = initializeAppearance()
	local ori = storeTransformation form
	appear = applyTransformation appear transformation[2]
	local new_id = #()
	for i = 1 to id.count do
	(
		append new_id appear.Item[id[i]]
	)
	puzzleConfig.set_item "Start" new_id
	append ops 2
	visualizeAppearance ori appear [0,-(ops.count-1)*40,0] false
)
button btnT3 "T -90 (3)" pos:[bPosX,bPosY+35*2] width:60 height:30
on btnT3 pressed do
(
	local appear = initializeAppearance()
	local ori = storeTransformation form
	appear = applyTransformation appear transformation[3]
	local new_id = #()
	for i = 1 to id.count do
	(
		append new_id appear.Item[id[i]]
	)
	puzzleConfig.set_item "Start" new_id
	append ops 3
	visualizeAppearance ori appear [0,-(ops.count-1)*40,0] false
)
button btnR1 "R 90 (4)" pos:[bPosX+80,bPosY] width:60 height:30
on btnR1 pressed do
(
	local appear = initializeAppearance()
	local ori = storeTransformation form
	appear = applyTransformation appear transformation[4]
	local new_id = #()
	for i = 1 to id.count do
	(
		append new_id appear.Item[id[i]]
	)
	puzzleConfig.set_item "Start" new_id
	append ops 4
	visualizeAppearance ori appear [0,-(ops.count-1)*40,0] false
)
button btnR2 "R 180 (5)" pos:[bPosX+80,bPosY+35] width:60 height:30
on btnR2 pressed do
(
	local appear = initializeAppearance()
	local ori = storeTransformation form
	appear = applyTransformation appear transformation[5]
	local new_id = #()
	for i = 1 to id.count do
	(
		append new_id appear.Item[id[i]]
	)
	puzzleConfig.set_item "Start" new_id
	append ops 5
	visualizeAppearance ori appear [0,-(ops.count-1)*40,0] false
)
button btnR3 "R -90 (6)" pos:[bPosX+80,bPosY+35*2] width:60 height:30
on btnR3 pressed do
(
	local appear = initializeAppearance()
	local ori = storeTransformation form
	appear = applyTransformation appear transformation[6]
	local new_id = #()
	for i = 1 to id.count do
	(
		append new_id appear.Item[id[i]]
	)
	puzzleConfig.set_item "Start" new_id
	append ops 6
	visualizeAppearance ori appear [0,-(ops.count-1)*40,0] false
)