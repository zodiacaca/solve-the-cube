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