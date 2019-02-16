
clearListener()
resetMaxFile #noPrompt

puzzleConfig = dotNetObject "System.Collections.Hashtable"
puzzleConfig.Add "Steps" 2
puzzleConfig.Add "CrossOnly" false
puzzleConfig.Add "Start" #("1","2","3","4","6","7","8","9", \
							"A","C","D","E","F")
puzzleConfig.Add "FinalCover" #("1","2","3","4","6","7","8","9", \
								"A","C","D","E","F")
puzzleConfig.Add "FinalCross" #("2","4","6","8","A","C","E")

formation = #()
moves = #()
alterMoves = #()
method = #()
alter = #()
alternative = #()
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
alterTransformation = #()
stepFormations = #()
opForm = undefined
obCam = undefined

id = #("1","2","3","4","6","7","8","9","A","C","D","E","F")

rollout ro1 "" width:650 height:400
(
	include "scripts\\solve\\functions.ms"
	
	local found = false
	local dCount = 0
	local pCount = 1
	local ops = #()

	progressBar pb1 "" pos:[5,10] width:215 height:15 \
	value:0 \
	color:(color 0 255 0)
	progressBar pb2 "" pos:[5,30] width:215 height:15 \
	value:0 \
	color:(color 0 255 0)
	
	include "scripts\\solve\\ro_cfg.ms"

	button btn1 "" pos:[70,120] width:80 height:30
	on btn1 pressed do
	(
		appear = initializeAppearance()
		crossMatch = false
		match = false
		if pCount == 1 then
		(
			for i = 1 to 20 do
			(
				local ori = storeTransformation appear
				num = random 1 6
				append ops num
				appear = applyTransformation appear transformation[num]
				visualizeAppearance ori appear [0,-(i-1)*40,0] true
			)
			
			pCount += 1
			
			local new_id = #()
			for i = 1 to id.count do
			(
				append new_id appear.Item[id[i]]
			)
			puzzleConfig.set_item "Start" new_id
		)
		else if pCount == 2 then
		(
			while not crossMatch do
			(
				num = random 7 transformation.count
				a = initializeAppearance()
				a = applyTransformation a transformation[num]
				new_id = #()
				for i = 1 to id.count do
				(
					append new_id a.Item[id[i]]
				)
				puzzleConfig.set_item "Start" new_id
				append ops num
				visualizeAppearance undefined a [0,-(ops.count-1)*40,0] false
				id2 = #("2","4","6","8","A","C","E")
				cm = true
				for j = 1 to id2.count do
				(
					if id2[j] != a.Item[id2[j]] do
						cm = false
				)
				if cm do
					crossMatch = true
			)
			
			pCount += 1
		)
		else if pCount == 3 then
		(
			for i = 1 to alterTransformation.count do
			(
				a = initializeAppearance()
				a = applyTransformation a alterTransformation[i]
				aa = #()
				for j = 1 to id.count do
				(
					append aa a.Item[id[j]]
				)
				if (appendUnique alternative aa) then
				(
					print ""
					print ""
					printAppearance a
				)
			)
			
			pCount += 1
		)
	)
	
	include "scripts\\solve\\ro_ops.ms"

	on ro1 open do
	(
		addTransformations()
		local ddlItems = #()
		for i = 1 to transformation.count do
		(
			append ddlItems method[i].desc
		)
		opForm = initializeAppearance()
		obCam = freecamera pos:[0,0,200]
		viewport.setLayout #layout_1
		viewport.setType #view_top
		viewport.setCamera obCam
		
		local file = openFile @"C:\Program Files\Autodesk\3ds Max 2012\Scripts\solve\t_2+3.txt"
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

			append moves m
			append transformation form
			append stepFormations[1] ("--" + (i + 6) as string)
		)
		free file
		
		file = openFile @"C:\Program Files\Autodesk\3ds Max 2012\Scripts\solve\alters.txt"
		file_line = #()
		num = 1
		while not (eof file) do
		(
			file_line[num] = readLine file
			num += 1
		)
		for i = 1 to (file_line.count / 5) do
		(
			local m = file_line[(i-1) * 5 + 1]
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
			
			append alterMoves m
			append alterTransformation form
		)
		free file
		
		file = openFile @"C:\Program Files\Autodesk\3ds Max 2012\Scripts\solve\alternatives.txt"
		file_line = #()
		num = 1
		while not (eof file) do
		(
			file_line[num] = readLine file
			num += 1
		)
		for i = 1 to (file_line.count / 5) do
		(
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
			
			local a = #()
			for j = 1 to id.count do
			(
				append a form.Item[id[j]]
			)
			append alternative a
		)
		free file

		ddl1.items = ddlItems
		spn1.value = puzzleConfig.Item["Steps"]
-- 		visualizeAppearances()
	)
)

if roFloater != undefined do closeRolloutFloater roFloater
roFloater = newRolloutFloater "" 650 400 30 100
addRollout ro1 roFloater
