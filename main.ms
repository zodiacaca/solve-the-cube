
clearListener()
resetMaxFile #noPrompt

puzzleConfig = dotNetObject "System.Collections.Hashtable"
puzzleConfig.Add "Steps" 2
puzzleConfig.Add "CrossOnly" false

moves = #()
alterMoves = #()
alter = #()

baseTransformation = #()
transformation = #()
alterTransformation = #()
tag = #()
stepFormations = #()
obCam = undefined

id_a = #("1","2","3","4","6","7","8","9","A","C","D","E","F")
id_t = #("1","2","3","4","6","7","8","9")
id_r = #("3","6","9","A","C","D","E","F")

rollout ro1 "" width:650 height:400
(
	include "scripts\\solve\\functions.ms"
	
	local found = false
	local dCount = 0
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
		for i = 1 to stepFormations[1].count do
		(
			if tag[i] == "CEA" then
			(
				for ii = 1 to transformation.count do
				(
					if tag[ii] == "AE" then
					(
						for iii = 1 to transformation.count do
						(
							if tag[iii] == "CE" then
							(
								appear = initializeAppearance()
								mvs = moves[i] + moves[ii] + moves[iii]
								steps = getStepArray mvs
								for j = 1 to steps.count do
								(
									appear = applyTransformation appear (steps[j] as integer)
								)
								if checkAppearance appear then
								(
									print mvs
									printAppearance appear
								)
							)
						)
					)
				)
			)
		)
	)
	
	include "scripts\\solve\\ro_ops.ms"

	on ro1 open do
	(
		readConfiguration()
		addTransformations()
		local ddlItems = #()
		stepFormations[1] = #()
		obCam = freecamera pos:[0,0,200]
		viewport.setLayout #layout_1
		viewport.setType #view_top
		viewport.setCamera obCam
		
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
			
			if form.Item["A"] != "A" and form.Item["C"] != "C" and form.Item["E"] != "E" then
			(
				if form.Item["E"] == "A" then
				(
					append tag "CEA"
				)
				else
				(
					append tag "EAC"
				)
			)
			else if form.Item["A"] == "A" and form.Item["C"] != "C" and form.Item["E"] != "E" then
			(
				append tag "CE"
			)
			else if form.Item["A"] != "A" and form.Item["C"] == "C" and form.Item["E"] != "E" then
			(
				append tag "AE"
			)

			append moves m
			append transformation form
			append stepFormations[1] ("--" + (i + 6) as string)
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
