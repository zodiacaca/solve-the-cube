
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
		appear = initializeAppearance()
		mvs = 
		steps = getStepArray mvs
		for j = 1 to steps.count do
		(
			appear = applyTransformation appear (steps[j] as integer)
		)
		print mvs
		printAppearance appear
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
		
		local file = openFile @"C:\Program Files\Autodesk\3ds Max 2012\Scripts\solve\alters_a.txt"
		local file_line = #()
		local num = 1
		while not (eof file) do
		(
			file_line[num] = readLine file
			num += 1
		)
		for i = 1 to (file_line.count / 7) do
		(
			local m = file_line[(i-1) * 7 + 1]
			
			appear = initializeAppearance()
			steps = getStepArray m
			for j = 1 to steps.count do
			(
				appear = applyTransformation appear (steps[j] as integer)
			)

			append moves m
			append transformation appear
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
