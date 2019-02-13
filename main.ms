
clearListener()
resetMaxFile #noPrompt

puzzleConfig = dotNetObject "System.Collections.Hashtable"
puzzleConfig.Add "Steps" 2
puzzleConfig.Add "CrossOnly" false
puzzleConfig.Add "Start" #("1","2","3","4","6","7","8","9", \
							"A","C","D","E","F")
-- puzzleConfig.Add "Start" #("F","C","9","E","6","D","A","3", \
-- 						"8","2","7","4","1")
puzzleConfig.Add "FinalCover" #("1","2","3","4","6","7","8","9", \
								"A","C","D","E","F")
puzzleConfig.Add "FinalCross" #("2","4","6","8","A","C","E")

formation = #()
moves = #()
method = #()
result = #()
struct roll
(
	desc,
	use
)
method[1] = roll "T 90" true
formation[1] = #(
	#("1", "3"),
	#("2", "6"),
	#("3", "9"),
	#("4", "2"),
	#("6", "8"),
	#("7", "1"),
	#("8", "4"),
	#("9", "7"),
	#("A", "A"),
	#("C", "C"),
	#("D", "D"),
	#("E", "E"),
	#("F", "F")
)
method[2] = roll "T 180" true
formation[2] = #(
	#("1", "9"),
	#("2", "8"),
	#("3", "7"),
	#("4", "6"),
	#("6", "4"),
	#("7", "3"),
	#("8", "2"),
	#("9", "1"),
	#("A", "A"),
	#("C", "C"),
	#("D", "D"),
	#("E", "E"),
	#("F", "F")
)
method[3] = roll "T -90" true
formation[3] = #(
	#("1", "7"),
	#("2", "4"),
	#("3", "1"),
	#("4", "8"),
	#("6", "2"),
	#("7", "9"),
	#("8", "6"),
	#("9", "3"),
	#("A", "A"),
	#("C", "C"),
	#("D", "D"),
	#("E", "E"),
	#("F", "F")
)
method[4] = roll "R 90" true
formation[4] = #(
	#("1", "1"),
	#("2", "2"),
	#("3", "D"),
	#("4", "4"),
	#("6", "A"),
	#("7", "7"),
	#("8", "8"),
	#("9", "3"),
	#("A", "E"),
	#("C", "6"),
	#("D", "F"),
	#("E", "C"),
	#("F", "9")
)
method[5] = roll "R 180" true
formation[5] = #(
	#("1", "1"),
	#("2", "2"),
	#("3", "F"),
	#("4", "4"),
	#("6", "E"),
	#("7", "7"),
	#("8", "8"),
	#("9", "D"),
	#("A", "C"),
	#("C", "A"),
	#("D", "9"),
	#("E", "6"),
	#("F", "3")
)
method[6] = roll "R -90" true
formation[6] = #(
	#("1", "1"),
	#("2", "2"),
	#("3", "9"),
	#("4", "4"),
	#("6", "C"),
	#("7", "7"),
	#("8", "8"),
	#("9", "F"),
	#("A", "6"),
	#("C", "E"),
	#("D", "3"),
	#("E", "A"),
	#("F", "D")
)

transformation = #()
stepFormations = #()
opForm = undefined

rollout ro1 "" width:240 height:240
(
	include "scripts\\solve\\functions.ms"
	
	local found = false
	local visualCount = 0

	progressBar pb1 "" pos:[5,10] width:215 height:15 \
	value:0 \
	color:(color 0 255 0)
	progressBar pb2 "" pos:[5,30] width:215 height:15 \
	value:0 \
	color:(color 0 255 0)
	
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

	button btn1 "" pos:[70,120] width:80 height:30
	on btn1 pressed do
	(
		local count = 1
		while count <= puzzleConfig.Item["Steps"] and not found do
		(
			pb1.value = (count as float / puzzleConfig.Item["Steps"] as float * 100) as Integer
			for i = 1 to stepFormations[count].count do
			(
				pb2.value = (i as float / stepFormations[count].count as float * 100) as Integer
				local step = getStepArray stepFormations[count][i]
				local appearance = initializeAppearance()
-- 				format "%\n" step
				for ii = 1 to step.count do
				(
					appearance = applyTransformation appearance transformation[step[ii] as Integer]
				)
				local match = checkAppearance appearance
				if match then
				(
					print stepFormations[count][i]
					print (phaseMove step)
					printAppearance appearance
					found = true
					exit
				)
			)
			count += 1
			print stepFormations[count-1].count
			if count <= puzzleConfig.Item["Steps"] then
			(
				stepFormations[count] = #()
				for i = 1 to transformation.count do
				(
					pb2.value = (i as float / transformation.count as float * 100) as Integer
					if method[i].use then
					(
						for ii = 1 to stepFormations[count-1].count do
						(
							append stepFormations[count] (stepFormations[count-1][ii] + "_" + i as string)
						)
					)
				)
				free stepFormations[count-1]
			)
		)
	)
	
	groupBox grp1 "" pos:[235,0] width:395 height:175
	
	dropDownList ddl1 "" pos:[245,15] width:375 height:30
	on ddl1 selected sel do
	(
		local ori = storeTransformation opForm
		operateTransformation ddl1.selection
		visualizeAppearance ori opForm [0,-visualCount*40,0]
		visualCount += 1
	)
	groupBox grp3 "" pos:[245,40] width:160 height:125
	local bPosX = 255
	local bPosY = 55
	button btnT1 "T 90" pos:[bPosX,bPosY] width:60 height:30
	on btnT1 pressed do
	(
		local ori = storeTransformation opForm
		operateTransformation 1
		visualizeAppearance ori opForm [0,-visualCount*40,0]
		visualCount += 1
	)
	button btnT2 "T 180" pos:[bPosX,bPosY+35] width:60 height:30
	on btnT2 pressed do
	(
		local ori = storeTransformation opForm
		operateTransformation 2
		visualizeAppearance ori opForm [0,-visualCount*40,0]
		visualCount += 1
	)
	button btnT3 "T -90" pos:[bPosX,bPosY+35*2] width:60 height:30
	on btnT3 pressed do
	(
		local ori = storeTransformation opForm
		operateTransformation 3
		visualizeAppearance ori opForm [0,-visualCount*40,0]
		visualCount += 1
	)
	button btnR1 "R 90" pos:[bPosX+80,bPosY] width:60 height:30
	on btnR1 pressed do
	(
		local ori = storeTransformation opForm
		operateTransformation 4
		visualizeAppearance ori opForm [0,-visualCount*40,0]
		visualCount += 1
	)
	button btnR2 "R 180" pos:[bPosX+80,bPosY+35] width:60 height:30
	on btnR2 pressed do
	(
		local ori = storeTransformation opForm
		operateTransformation 5
		visualizeAppearance ori opForm [0,-visualCount*40,0]
		visualCount += 1
	)
	button btnR3 "R -90" pos:[bPosX+80,bPosY+35*2] width:60 height:30
	on btnR3 pressed do
	(
		local ori = storeTransformation opForm
		operateTransformation 6
		visualizeAppearance ori opForm [0,-visualCount*40,0]
		visualCount += 1
	)

	on ro1 open do
	(
		addTransformations()
		local ddlItems = #()
		for i = 1 to transformation.count do
		(
			append ddlItems method[i].desc
		)
		opForm = initializeAppearance()
		
		local file = openFile @"C:\Program Files\Autodesk\3ds Max 2012\Scripts\solve\t_2.txt"
		local file_line = #()
		local num = 1
		while not (eof file) do
		(
			file_line[num] = readLine file
			num += 1
		)
		for i = 1 to (file_line.count / 5) do
		(
			local m = file_line[(i-1) * 5 + 1]
			local r = roll file_line[(i-1) * 5 + 2] true
			append method r
			append ddlItems file_line[(i-1) * 5 + 2]
			local form = dotNetObject "System.Collections.Hashtable"
			for row = 1 to 3 do
			(
				for col = 1 to 3 do
				(
					local l = file_line[(i-1) * 5 + 2 + row]
					local c = l[(col - 1) * 2 + 1]
					local id = (row - 1) * 3 + col
					if not (row == 2 and col == 2) do
						form.Add (id as string) c
				)
			)
			local id_c = #("A","C","D","E","F")
			local l1 = file_line[(i-1) * 5 + 3]
			form.Add "A" l1[l1.count - 2]
			local l2 = file_line[(i-1) * 5 + 5]
			form.Add "C" l2[l2.count - 2]
			for row = 1 to 3 do
			(
				local l = file_line[(i-1) * 5 + 2 + row]
				local c = l[l.count]
				local id = id_c[row + 2]
				form.Add id c
			)

-- 			append moves m
-- 			append transformation form
-- 			append stepFormations[1] ("_" + (i + 6) as string)
		)

		ddl1.items = ddlItems
		spn1.value = puzzleConfig.Item["Steps"]
		local ori = initializeAppearance()
		local rowC = 0
		for i = 7 to transformation.count do
		(
-- 			visualizeAppearance ori transformation[i] [rowC * 70,-40 * (mod (i+5) 12),0]
-- 			if mod (i+5) 12 == 0 do
-- 				rowC += 1
		)
	)
)

if roFloater != undefined do closeRolloutFloater roFloater
roFloater = newRolloutFloater "" 650 240 30 100
addRollout ro1 roFloater
