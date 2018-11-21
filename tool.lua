local tool = {}
local ts = require("ts")
function tool.msleep(time)
	mSleep(time)
end
function tool.sleep(time)
	mSleep(time * 1000)
end
function tool.alert(msg, time)
	--toast(msg, 1)
	fwShowWnd("wid",100,0,600,30,0);
	fwShowTextView("wid","textid",msg,"left","FF0000","FFDAB9",12,0,0,0,500,30,1);
	if (time) then mSleep(time * 1000) end
end
function tool.dlg(msg, time)
	dialog(msg, time)
end
function tool.empty(x, y, color)
	local color0 = 105  
	if (color) then 
		color0 = color
	end
	tool.keepScreen()
	local r0, g0, b0 = tool.getColorRGB(x, y)  
	local cnt = 0
	for i = 1, 100 do
		local r, g, b = tool.getColorRGB(x + i, y)
		if (math.abs(r0 - r) > color0 or math.abs(g0 - g) > color0 or math.abs(b0 - b) > color0) then
			cnt = cnt + 1
			if (cnt > 10) then
				tool.unkeepScreen()
				return false
			end
		end
	end
	tool.unkeepScreen()
	return true
end
function tool.input(x, y, text, color)
	while (not tool.empty(x, y, color)) do
		keyDown("RightGUI")
		keyDown("a")
		keyUp("a")
		keyUp("RightGUI")
		mSleep(100)
		keyDown("DeleteForward")
		keyUp("DeleteForward")
	end
	mSleep(500)
	tool.tap(x + 10, y)
	mSleep(1000)
	while (tool.empty(x, y, color)) do
		inputText(text, 20)
		mSleep(2000)
	end
end
function tool.paste(x, y, text, color)
	while (not tool.empty(x, y, color)) do
		keyDown("RightGUI")
		keyDown("a")
		keyUp("a")
		keyUp("RightGUI")
		mSleep(100)
		keyDown("DeleteForward")
		keyUp("DeleteForward")
	end
	mSleep(500)
	tool.tap(x + 10, y)
	mSleep(1000)
	while (tool.empty(x, y, color)) do
		writePasteboard(text)
		keyDown("RightGUI")
		keyDown("v")
		keyUp("v")
		keyUp("RightGUI")
		mSleep(2000)
	end
end
function tool.keyin(x, y, text, color)
	while (not tool.empty(x, y, color)) do
		keyDown("RightGUI")
		keyDown("a")
		keyUp("a")
		keyUp("RightGUI")
		mSleep(100)
		keyDown("DeleteForward")
		keyUp("DeleteForward")
	end
	mSleep(500)
	tool.tap(x + 10, y)
	mSleep(1000)
	while (tool.empty(x, y, color)) do
		inputText(text)
		mSleep(2000)
	end
end
function tool.tap(x, y, time)
	x = x + math.random(-2, 2)
	y = y + math.random(-2, 2)
	touchDown(x, y)
	mSleep(30)
	touchUp(x, y)
	if (time) then mSleep(time * 1000 + math.random(100, 300)) end
end
function tool.move(startX, startY, step, endX, endY, delay)
	local tX, tY = endX - startX, endY - startY
	local cnt = math.max(math.abs(tX / step), math.abs(tY / step))
	local deltaX, deltaY = tX / cnt, tY / cnt
	touchDown(startX, startY)
	mSleep(50)
	for i = 1, cnt do
		touchMove(startX + deltaX * i, startY + deltaY * i)
		mSleep(10)
	end
	mSleep(delay)
	touchUp(endX, endY)
end
function tool.post(name, url, data)
	while (true) do
		local c, h, b = ts.httpPost(url, {["Content-Type"] = "application/json"}, ts.json.encode(data))
		if (c == 200) then
			return b
		elseif (c == 204) then
			return ""
		else
			tool.alert("请求" .. name .. "数据，网络出错，代码：" .. c .. "，稍后重试", 3)
		end
	end
end
function tool.get(name, url)
	while (true) do
		local c, h, b = ts.httpGet(url)
		if (c == 200) then
			return b
		elseif (c == 204) then
			return ""
		else
			tool.alert("请求" .. name .. "数据，网络出错，代码：" .. c .. "，稍后重试", 3)
		end
	end
end
function tool.httpGet(url)
	return ts.httpGet(url)
end
function tool.httpPost(url, header, data)
	return ts.httpPost(url, header, data)
end
function tool.downLoad(ftpFile, localFile, server, user, pswd)
	while (not ts.ftp.connect(server, user, pswd)) do
		tool.alert("Ftp服务器连接失败，稍后重试", 2)
	end
	tool.alert("Ftp服务器连接成功，开始下载", 1)
	while (not ts.ftp.download(localFile, ftpFile, 0)) do
		tool.alert("Ftp文件下载失败，稍后重试", 2)
		tool.rmfile(localFile)
	end
	tool.alert("Ftp文件下载完成", 1)
	ts.ftp.close()
end
function tool.upload(localFile, ftpFile, server, user, pswd)
	while (not ts.ftp.connect(server, user, pswd)) do
		tool.alert("Ftp服务器连接失败，稍后重试", 2)
	end
	tool.alert("Ftp服务器连接成功，开始上传", 1)
	while (not ts.ftp.upload(localFile, ftpFile, 0)) do
		tool.alert("Ftp文件上传失败，稍后重试", 2)
	end
	tool.alert("Ftp文件上传完成", 1)
	ts.ftp.close()
	return io.open(localFile):seek("end", 0)
end
function tool.mkdir(folder)
	if (not ts.hlfs.isDir(folder)) then
--		while (not ts.hlfs.makeDir(folder)) do
--			tool.alert("文件夹创建失败，稍后重试")
--		end
		os.execute("mkdir '" .. folder .. "'")
		mSleep(1000)
		os.execute("chown -R mobile:mobile " .. folder)
		os.execute("chmod -R 777 " .. folder)
	end
end
function tool.rmdir(folder)
	if (ts.hlfs.isDir(folder)) then
		os.execute("rm -rf ".. folder)
		mSleep(1000)
	end
end
function tool.rmfile(file)
	if (isFileExist(file)) then
		delFile(file)
	end
end
function tool.copy(from, to)
	if (not isFileExist(from)) then
		tool.alert(from .. "文件不存在")
		return false
	end
	tool.rmfile(to)
	os.execute("cp -rf '" .. from .. "' '" .. to .. "'")
end
function tool.split(str, reps)
	local resultStrList = {}
	string.gsub(str,'[^'..reps..']+', function (w) table.insert(resultStrList, w) end)
	return resultStrList
end
function tool.getParentFolder(folder)
	local tab = tool.split(folder, "/")
	local result = ""
	for idx = 1, #tab - 1 do
		result = result .. "/" .. tab[idx]
		tool.mkdir(result)
	end
	return result
end
function tool.encode(data)
	return ts.json.encode(data)
end
function tool.decode(json)
	return ts.json.decode(json)
end
function tool.existFile(fname)
	return isFileExist(fname)
end
function tool.existDir(path)
	return ts.hlfs.isDir(path)
end
function tool.writeFile(fname, content)
	return writeFileString(fname, content, "w", 1)
end
function tool.readFile(fname)
	return readFileString(fname)
end
function tool.readAllLine(fname)
	return readFile(fname)
end
function tool.isFrontApp(bid)
	return isFrontApp(bid) == 1
end
function tool.runApp(bid)
	runApp(bid)
end
function tool.closeApp(bid)
	closeApp(bid, 1)
end
function tool.closeAll()
	closeApp("*",1)
end
function tool.hasApp(bid)
	return appBundlePath(bid)
end
function tool.initScreen(flag)
	init(flag)
end
function tool.keepScreen()
	keepScreen(true)
end
function tool.unkeepScreen()
	keepScreen(false)
end
function tool.restart()
	lua_restart()
end
function tool.appDataPath(bid)
	return appDataPath(bid)
end
function tool.fileList(path)
	return ts.hlfs.getFileList(path)
end
function tool.install(ipaFile)
	return ipaInstall(ipaFile) == 1
end
function tool.lockScreen()
	while (deviceIsLock() == 0) do
		lockDevice()
	end
end
function tool.unlockScreen()
	while (deviceIsLock() ~= 0) do
		unlockDevice ()
		mSleep(1000)
	end
end
function tool.initDevice()
	tool.unlockScreen()
	setRotationLockEnable(true)
	setAssistiveTouchEnable(false)
	setVolumeLevel(0)
	setAutoLockTime(0)
--	touch.show_pose(true)
--	screen.init(0)
end
function tool.fakeGPS(bid, lat, lng)
	fakeGPS(lng, lat)
end
function tool.time()
	return os.time()
end
function tool.getColor(x, y)
	return getColor(x, y)
end
function tool.getColorRGB(x, y)
	return getColorRGB(x, y)
end
function tool.isColor(x, y, color, similar)
	return isColor(x, y, color, similar)
end
function tool.findColor(points, similar, rect)
	local first = points[1]
	local pointStr = ""
	for i, feature in ipairs(points) do
		if (i ~= 1) then
			if (pointStr ~= "") then pointStr = pointStr .. "," end
			pointStr = pointStr .. (feature[1] - first[1]) .. "|" .. (feature[2] - first[2]) .. "|" .. string.format("0x%x", feature[3])
		end
	end
	return findMultiColorInRegionFuzzy(first[3], pointStr, similar, rect[1], rect[2], rect[3], rect[4])
end
function tool.exit()
	lua_exit()
end
function tool.remainSpace()
	return getMemoryInfo().free
end
function tool.getLuaPath()
	return "/var/mobile/Media/TouchSprite/lua/"
end
function tool.inputText(text)
	inputText(text, 20)
	mSleep(2000)
end
function tool.pasteText(text)
	writePasteboard(text)
	keyDown("RightGUI")
	keyDown("v")
	keyUp("v")
	keyUp("RightGUI")
	mSleep(2000)
end
function tool.keyinText(text)
	inputText(text)
	mSleep(2000)
end
function tool.randomStr(str, num)
  local ret =''
  for i = 1, num do
    local rchr = math.random(1, string.len(str))
    ret = ret .. string.sub(str, rchr, rchr)
  end
  return ret
end
return tool
