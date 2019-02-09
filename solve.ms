
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

fn appendUnique a obj =
(
	local unique = true
	for i = 1 to a.count do
	(
		local d = true
		for ii = 1 to a[i].count do
		(
			if obj[ii] != a[i][ii] do
				d = false
		)
		if d == true do
			unique = false
	)

	return unique
)

fn initializeAppearance =
(
	local appearance = dotNetObject "System.Collections.Hashtable"

	local id = #("1","2","3","4","6","7","8","9", \
				"A","C","D","E","F")

	for i = 1 to id.count do
	(
		appearance.Add id[i] puzzleConfig.Item["Start"][i]
	)

	return appearance
)

fn addTransformations =
(
	stepFormations[1] = #()
	for i = 1 to formation.count do
	(
		if method[i].use then
		(
			local form = dotNetObject "System.Collections.Hashtable"
			for ii = 1 to formation[i].count do
			(
				form.Add formation[i][ii][1] formation[i][ii][2]
			)
			append moves ("_" + i as string)
			append transformation form
			append stepFormations[1] ("_" + i as string)
		)
		else
		(
			append transformation undefined
		)
	)
)

fn applyTransformation old form =
(
	local id = #("1","2","3","4","6","7","8","9", \
				"A","C","D","E","F")
	local new = dotNetObject "System.Collections.Hashtable"
	for i = 1 to id.count do
	(
		new.Add id[i] old.Item[form.Item[id[i]]]
	)

	return new
)

fn storeTransformation form =
(
	local id = #("1","2","3","4","6","7","8","9", \
				"A","C","D","E","F")
	local old = dotNetObject "System.Collections.Hashtable"
	for i = 1 to id.count do
	(
		old.Add id[i] form.Item[id[i]]
	)

	return old
)

fn operateTransformation i =
(
	opForm = applyTransformation opForm transformation[i]
	printAppearance opForm
	for i = 1 to 10 do
	(
		format "%" "-"
	)
	format "%\n" ""
)

fn checkAppearance appear =
(
	local id = #("1","2","3","4","6","7","8","9", \
				"A","C","D","E","F")
	local alt = puzzleConfig.Item["FinalCover"]
	if puzzleConfig.Item["CrossOnly"] then
	(
		id = #("2","4","6","8","A","C","E")
		alt = puzzleConfig.Item["FinalCross"]
	)
	for i = 1 to id.count do
	(
		if appear.Item[id[i]] != alt[i] do
			return false
	)

	return true
)

fn phaseMove raw =
(
	local str = ""
	for i = 1 to raw.count do
	(
		str += "["
		str += method[raw[i] as Integer].desc
		str += "] "
	)
	
	return (substring str 1 (str.count - 1))
)

fn printAppearance appear =
(
	format "% % % % %\n%   %   %\n% % % % %\n" \
	appear.Item["1"] \
	appear.Item["2"] \
	appear.Item["3"] \
	appear.Item["A"] \
	appear.Item["D"] \
	appear.Item["4"] \
	appear.Item["6"] \
	appear.Item["E"] \
	appear.Item["7"] \
	appear.Item["8"] \
	appear.Item["9"] \
	appear.Item["C"] \
	appear.Item["F"]
)

fn findOriIndex last newId =
(
	local id = #("1","2","3","4","6","7","8","9", \
				"A","C","D","E","F")
	local index = 1
	for i = 1 to id.count do
	(
		if last.Item[id[i]] == newId then
		(
			index = i
			exit
		)
	)
	
	return index
)

fn visualizeAppearance last form pos =
(
	local id = #("1","2","3","4","6","7","8","9", \
				"A","C","D","E","F")
	local tPos = #(
		[5,-8.5,0],
		[15,-8.5,0],
		[25,-8.5,0],
		[5,-18.5,0],
		[25,-18.5,0],
		[5,-28.5,0],
		[15,-28.5,0],
		[25,-28.5,0],
		[35,-8.5,0],
		[35,-28.5,0],
		[45,-8.5,0],
		[45,-18.5,0],
		[45,-28.5,0]
		)
	local cPos = #(
		[5,-5,0],
		[15,-5,0],
		[25,-5,0],
		[5,-15,0],
		[25,-15,0],
		[5,-25,0],
		[15,-25,0],
		[25,-25,0],
		[35,-5,0],
		[35,-25,0],
		[45,-5,0],
		[45,-15,0],
		[45,-25,0]
		)
	local norCol = [214,228,153]
	local altCol = [255,90,0]
	for i = 1 to id.count do
	(
		t = text text:form.Item[id[i]] \
		size:10 wirecolor:norCol pos:(pos+tPos[i])
		if form.Item[id[i]] != last.Item[id[i]] then
		(
			t.wirecolor = altCol
			local index = findOriIndex last form.Item[id[i]]
			local oldPos = cPos[index]
			ss = SplineShape wirecolor:[255,255,0] pos:(pos+oldPos-[0,4,0])
			addNewSpline ss
			addKnot ss 1 #corner #line (pos+oldPos-[0,4,0])
			addKnot ss 1 #corner #line (pos+cPos[i])
			updateShape ss
			ra = rectangle width:0.5 length:0.5 wirecolor:[255,255,0] pos:(pos+cPos[i])
		)
	)
)

rollout ro1 "" width:240 height:240
(
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
			if count == 2 then
			(
				pb1.value = (count as float / puzzleConfig.Item["Steps"] as float * 100) as Integer
				for i = 1 to stepFormations[count].count do
				(
					pb2.value = (i as float / stepFormations[count].count as float * 100) as Integer
					local step = filterString stepFormations[count][i] "_"
					local appearance = initializeAppearance()
	-- 				format "%\n" step
					for ii = 1 to step.count do
					(
						appearance = applyTransformation appearance transformation[step[ii] as Integer]
					)
					local id = #("1","2","3","4","6","7","8","9", \
								"A","C","D","E","F")
					local id2 = #("2","4","6","8","A","C","E")
					local r = #()
					local crossMatch = true
					for j = 1 to id2.count do
					(
						if id2[j] != appearance.Item[id2[j]] do
							crossMatch = false
					)
					if crossMatch then
					(
						for k = 1 to id.count do
						(
							append r appearance.Item[id[k]]
						)
						if (appendUnique result r) then
						(
-- 							format "%\n" r
							append result r
							local ms = ""
							for s = 1 to step.count do
							(
								ms += moves[step[s] as Integer]
							)
							print ms
							local ma = filterString ms "_"
							print (phaseMove ma)
							printAppearance appearance
						)
					)
-- 				local match = checkAppearance appearance
-- 				if match then
-- 				(
-- 					print stepFormations[count][i]
-- 					print (phaseMove step)
-- 					printAppearance appearance
-- 					found = true
-- 					exit
-- 				)
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
-- 							local step = filterString stepFormations[count-1][ii] "_"
-- 							local lastStep = step[step.count] as Integer
-- 							if i >= 4 and lastStep <= 3 then
-- 							(
-- 								append stepFormations[count] (stepFormations[count-1][ii] + "_" + i as string)
-- 							)
-- 							else if i <= 3 and lastStep >= 4 then
-- 							(
-- 								append stepFormations[count] (stepFormations[count-1][ii] + "_" + i as string)
-- 							)
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
		
		local file = openFile @"C:\Program Files\Autodesk\3ds Max 2012\Scripts\solve\r_a_2.txt"
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
			append stepFormations[1] ("_" + (i + 6) as string)
			
-- 			local mthd = file_line[(i-1) * 5 + 1]
-- 			if findString mthd "2" == 1 then
-- 			(
-- 				for ii = 1 to 2 do
-- 				(
-- 					local p = (ii-1) * 4 + 1
-- 					mthd = replace mthd p 1 "1"
-- 				)
-- 				for ii = 1 to 2 do
-- 				(
-- 					local p = (ii-1) * 4 + 3
-- 					mthd = replace mthd p 1 "3"
-- 				)
-- 			)
-- 			else
-- 			(
-- 				for ii = 1 to 2 do
-- 				(
-- 					local p = (ii-1) * 4 + 2
-- 					mthd = replace mthd p 1 "1"
-- 				)
-- 				for ii = 1 to 2 do
-- 				(
-- 					local p = (ii-1) * 4 + 4
-- 					mthd = replace mthd p 1 "3"
-- 				)
-- 			)
-- 			local appearance = initializeAppearance()
-- 			for ii = 1 to mthd.count do
-- 			(
-- 				appearance = applyTransformation appearance transformation[mthd[ii] as Integer]
-- 			)
-- 			print mthd
-- 			print (phaseMove mthd)
-- 			printAppearance appearance
		)

		ddl1.items = ddlItems
		spn1.value = puzzleConfig.Item["Steps"]
		local ori = initializeAppearance()
		local rowC = 0
		for i = 7 to transformation.count do
		(
-- 			if mod (i+5) 12 == 0 do
-- 				rowC += 1
-- 			visualizeAppearance ori transformation[i] [rowC * 70,-40 * (mod (i+5) 12),0]
-- 			print method[i].desc
-- 			printAppearance transformation[i]
		)
		
-- 		for i = 1 to 12 do
-- 		(
-- 			local appearance = initializeAppearance()
-- 			appearance = applyTransformation appearance transformation[1]
-- 			appearance = applyTransformation appearance transformation[i + 6]
-- 			appearance = applyTransformation appearance transformation[3]
-- 			print ("1" + "_180_" + "3")
-- 			print (method[1].desc + " " + method[i + 6].desc + " " + method[3].desc)
-- 			printAppearance appearance
-- 		)
-- 		for i = 1 to 12 do
-- 		(
-- 			local appearance = initializeAppearance()
-- 			appearance = applyTransformation appearance transformation[3]
-- 			appearance = applyTransformation appearance transformation[i + 6 + 12]
-- 			appearance = applyTransformation appearance transformation[1]
-- 			print ("3" + "_XY_" + "1")
-- 			print (method[3].desc + " " + method[i + 6 + 12].desc + " " + method[1].desc)
-- 			printAppearance appearance
-- 		)
	)
)

if roFloater != undefined do closeRolloutFloater roFloater
roFloater = newRolloutFloater "" 650 240 30 100
addRollout ro1 roFloater
