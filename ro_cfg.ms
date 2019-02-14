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

local aPosX = 20
local aPosY = 235

label lbl1 "Start:" pos:[aPosX,aPosY-20] width:30 height:20

dropDownList ddlS1 "" pos:[aPosX,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:1
on ddlS1 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[1] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlS2 "" pos:[aPosX+50,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:2
on ddlS2 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[2] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlS3 "" pos:[aPosX+50*2,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:3
on ddlS3 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[3] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlS4 "" pos:[aPosX,aPosY+30] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:4
on ddlS4 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[4] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlS6 "" pos:[aPosX+50*2,aPosY+30] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:5
on ddlS6 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[5] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlS7 "" pos:[aPosX,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:6
on ddlS7 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[6] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlS8 "" pos:[aPosX+50,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:7
on ddlS8 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[7] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlS9 "" pos:[aPosX+50*2,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:8
on ddlS9 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[8] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlSA "" pos:[aPosX+50*3,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:9
on ddlSA selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[9] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlSC "" pos:[aPosX+50*3,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:10
on ddlSC selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[10] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlSD "" pos:[aPosX+50*4,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:11
on ddlSD selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[11] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlSE "" pos:[aPosX+50*4,aPosY+30] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:12
on ddlSE selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[12] = id[sel]
	puzzleConfig.set_item "Start" new_id
)
dropDownList ddlSF "" pos:[aPosX+50*4,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:13
on ddlSF selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["Start"]
	new_id[13] = id[sel]
	puzzleConfig.set_item "Start" new_id
)

label lbl2 "Final:" pos:[aPosX+280,aPosY-20] width:30 height:20

dropDownList ddlF1 "" pos:[aPosX+280,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:1
on ddlF1 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[1] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlF2 "" pos:[aPosX+280+50,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:2
on ddlF2 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[2] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlF3 "" pos:[aPosX+280+50*2,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:3
on ddlF3 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[3] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlF4 "" pos:[aPosX+280,aPosY+30] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:4
on ddlF4 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[4] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlF6 "" pos:[aPosX+280+50*2,aPosY+30] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:5
on ddlF6 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[5] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlF7 "" pos:[aPosX+280,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:6
on ddlF7 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[6] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlF8 "" pos:[aPosX+280+50,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:7
on ddlF8 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[7] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlF9 "" pos:[aPosX+280+50*2,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:8
on ddlF9 selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[8] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlFA "" pos:[aPosX+280+50*3,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:9
on ddlFA selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[9] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlFC "" pos:[aPosX+280+50*3,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:10
on ddlFC selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[10] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlFD "" pos:[aPosX+280+50*4,aPosY] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:11
on ddlFD selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[11] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlFE "" pos:[aPosX+280+50*4,aPosY+30] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:12
on ddlFE selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[12] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)
dropDownList ddlFF "" pos:[aPosX+280+50*4,aPosY+30*2] width:40 height:20 \
items:#("1","2","3","4","6","7","8","9","A","C","D","E","F") \
selection:13
on ddlFF selected sel do
(
	local new_id = deepCopy puzzleConfig.Item["FinalCover"]
	new_id[13] = id[sel]
	puzzleConfig.set_item "FinalCover" new_id
)