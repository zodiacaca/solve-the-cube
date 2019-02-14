groupBox grp2 "" pos:[5,50] width:215 height:60

radioButtons rdo1 "" pos:[15,85] width:100 height:20 \
labels:#("Cover", "Cross")
on rdo1 changed stat do
(
	if stat == 1 then
	(
		puzzleConfig.set_item "CrossOnly" false
	)
	else
	(
		puzzleConfig.set_item "CrossOnly" true
	)
)

spinner spn1 "Steps:" pos:[45,65] width:50 height:18 \
type:#integer scale:1
on spn1 changed val do
(
	puzzleConfig.set_item "Steps" val
)

groupBox grp4 "" pos:[5,200] width:625 height:150

local aPosX = 15
local aPosY = 220

dropDownList ddlS1 "" pos:[aPosX,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:1
on ddlS1 selected sel do
(
	puzzleConfig.set_item "1" ddlS1.selected
)
dropDownList ddlS2 "" pos:[aPosX+50,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:2
on ddlS2 selected sel do
(
	puzzleConfig.set_item "2" ddlS2.selected
)
dropDownList ddlS3 "" pos:[aPosX+50*2,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:3
on ddlS3 selected sel do
(
	puzzleConfig.set_item "3" ddlS3.selected
)
dropDownList ddlS4 "" pos:[aPosX,aPosY+30] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:4
on ddlS4 selected sel do
(
	puzzleConfig.set_item "4" ddlS4.selected
)
dropDownList ddlS6 "" pos:[aPosX+50*2,aPosY+30] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:5
on ddlS6 selected sel do
(
	puzzleConfig.set_item "6" ddlS6.selected
)
dropDownList ddlS7 "" pos:[aPosX,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:6
on ddlS7 selected sel do
(
	puzzleConfig.set_item "7" ddlS7.selected
)
dropDownList ddlS8 "" pos:[aPosX+50,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:7
on ddlS8 selected sel do
(
	puzzleConfig.set_item "8" ddlS8.selected
)
dropDownList ddlS9 "" pos:[aPosX+50*2,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:8
on ddlS9 selected sel do
(
	puzzleConfig.set_item "9" ddlS9.selected
)
dropDownList ddlSA "" pos:[aPosX+50*3,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:9
on ddlSA selected sel do
(
	puzzleConfig.set_item "A" ddlSA.selected
)
dropDownList ddlSC "" pos:[aPosX+50*3,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:10
on ddlSC selected sel do
(
	puzzleConfig.set_item "C" ddlSC.selected
)
dropDownList ddlSD "" pos:[aPosX+50*4,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:11
on ddlSD selected sel do
(
	puzzleConfig.set_item "D" ddlSD.selected
)
dropDownList ddlSE "" pos:[aPosX+50*4,aPosY+30] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:12
on ddlSE selected sel do
(
	puzzleConfig.set_item "E" ddlSE.selected
)
dropDownList ddlSF "" pos:[aPosX+50*4,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:13
on ddlSF selected sel do
(
	puzzleConfig.set_item "F" ddlSF.selected
)