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

fn getStepArray raw =
(
	local step = filterString raw "_"
	
	return step
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
	format "%\n"moves[i]
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