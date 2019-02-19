fn printAppearance appear =
(
	format "% % % % %\n%   %   %\n% % % % %\n" \
	appear.Item["1"][1] \
	appear.Item["2"][1] \
	appear.Item["3"][1] \
	appear.Item["A"][1] \
	appear.Item["D"][1] \
	appear.Item["4"][1] \
	appear.Item["6"][1] \
	appear.Item["E"][1] \
	appear.Item["7"][1] \
	appear.Item["8"][1] \
	appear.Item["9"][1] \
	appear.Item["C"][1] \
	appear.Item["F"][1]
	
	format "% % % % %\n%   %   %\n% % % % %\n" \
	appear.Item["1"][2] \
	appear.Item["2"][2] \
	appear.Item["3"][2] \
	appear.Item["A"][2] \
	appear.Item["D"][2] \
	appear.Item["4"][2] \
	appear.Item["6"][2] \
	appear.Item["E"][2] \
	appear.Item["7"][2] \
	appear.Item["8"][2] \
	appear.Item["9"][2] \
	appear.Item["C"][2] \
	appear.Item["F"][2]
)

fn getStepArray raw =
(
	local step = filterString raw "--"
	
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
			if obj[ii].id != a[i][ii].id do
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

	for i = 1 to id_a.count do
	(
		appearance.Add id_a[i] puzzleConfig.Item["Start"][i]
	)

	return appearance
)

fn readCell fLine =
(
	ss = fLine as stringstream
	id = readToken ss
	mat = substring fLine 3 (fLine.count - 2)
	
	return #(id,mat)
)

fn readConfiguration =
(
	file = openFile @"C:\Program Files\Autodesk\3ds Max 2012\Scripts\solve\config.txt"
	file_line = #()
	num = 1
	while not (eof file) do
	(
		file_line[num] = readLine file
		num += 1
	)
	start = #()
	for i = 2 to 14 do
	(
		info = readCell file_line[i]
		append start #(info[1],info[2])
	)
	puzzleConfig.Add "Start" start
	finalCover = #()
	for i = 16 to 28 do
	(
		info = readCell file_line[i]
		append finalCover #(info[1],info[2])
	)
	puzzleConfig.Add "FinalCover" finalCover
	finalCross = #()
	for i = 30 to 36 do
	(
		info = readCell file_line[i]
		append finalCross #(info[1],info[2])
	)
	puzzleConfig.Add "FinalCross" finalCross
	free file
)

fn addTransformations =
(
	file = openFile @"C:\Program Files\Autodesk\3ds Max 2012\Scripts\solve\baseTransformation.txt"
	file_line = #()
	num = 1
	while not (eof file) do
	(
		file_line[num] = readLine file
		num += 1
	)
	for i = 1 to (file_line.count / 4) do
	(
		local form = dotNetObject "System.Collections.Hashtable"
		for row = 1 to 3 do
		(
			for col = 1 to 3 do
			(
				local l = file_line[(i-1) * 4 + 1 + row]
				local c = l[(col - 1) * 2 + 1]
				local id = (row - 1) * 3 + col
				if not (row == 2 and col == 2) do
					form.Add (id as string) c
			)
		)
		local id_c = #("A","C","D","E","F")
		local l1 = file_line[(i-1) * 4 + 2]
		form.Add "A" l1[l1.count - 2]
		local l2 = file_line[(i-1) * 4 + 4]
		form.Add "C" l2[l2.count - 2]
		for row = 1 to 3 do
		(
			local l = file_line[(i-1) * 4 + 1 + row]
			local c = l[l.count]
			local id = id_c[row + 2]
			form.Add id c
		)

		append baseTransformation form
	)
	free file
)

fn applyTransformation old index =
(
	local new = dotNetObject "System.Collections.Hashtable"
	local form = baseTransformation[index]
	local angles = #(90,180,-90,90,180,-90)
	if index as Integer <= 3 then
	(
		for i = 1 to id_t.count do
		(
			m = execute old.Item[form.Item[id_t[i]][1]][2]
			m = rotateZ m angles[index]
			new.Add id_t[i] \
			#(old.Item[form.Item[id_t[i]][1]][1],m as string)
		)
		for i = 1 to id_a.count do
		(
			if findItem id_t id_a[i] == 0 then
			(
				m = old.Item[form.Item[id_a[i]][1]][2]
				new.Add id_a[i] \
				#(old.Item[form.Item[id_a[i]][1]][1],m)
			)
		)
	)
	else
	(
		for i = 1 to id_r.count do
		(
			m = execute old.Item[form.Item[id_r[i]][1]][2]
			m = rotateX m angles[index]
			new.Add id_r[i] \
			#(old.Item[form.Item[id_r[i]][1]][1],m as string)
		)
		for i = 1 to id_a.count do
		(
			if findItem id_r id_a[i] == 0 then
			(
				m = old.Item[form.Item[id_a[i]][1]][2]
				new.Add id_a[i] \
				#(old.Item[form.Item[id_a[i]][1]][1],m)
			)
		)
	)

	return new
)

fn storeTransformation form =
(
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
	local alt = puzzleConfig.Item["FinalCover"]
	if puzzleConfig.Item["CrossOnly"] then
	(
		id_a = #("2","4","6","8","A","C","E")
		alt = puzzleConfig.Item["FinalCross"]
	)
	for i = 1 to id_a.count do
	(
		if appear.Item[id_a[i]][1] != alt[i][1] do
			return false
	)

	return true
)

fn findOriIndex last newId =
(
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

fn visualizeAppearance last form pos tile =
(
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
	for i = 1 to id_a.count do
	(
		t = text text:form.Item[id_a[i]][1] \
		size:10 wirecolor:norCol pos:(pos+tPos[i])
		if not tile then
		(
			m = execute form.Item[id_a[i]][2]
			m.row4 = t.pos
			t.transform = m
			if form.Item[id_a[i]][1] == id_a[i] and form.Item[id_a[i]][2] == (matrix3 1) as string then
			(
				t.wirecolor = [0,150,200]
			)
		)
		else
		(
			if form.Item[id_a[i]] != last.Item[id_a[i]] then
			(
				t.wirecolor = altCol
				local index = findOriIndex last form.Item[id_a[i]]
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
	obCam.pos = pos + [0,-15,200]
)

fn visualizeAppearances =
(
	local ori = initializeAppearance()
	local rowC = 0
	for i = 1 to transformation.count do
	(
		visualizeAppearance undefined transformation[i] [rowC * 70,-40 * (mod (i-1) 12),0] false
		if mod i 12 == 0 do
			rowC += 1
	)
)