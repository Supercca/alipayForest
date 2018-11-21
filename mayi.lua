local tool=require("tool")
function mayi() 
	if tool.isFrontApp("com.eg.android.AlipayGphone") then
		--没找到蚂蚁森林，向上滑。
		x,y=tool.findColor({
				{  312,   80, 0x8abae0},
				{  356,   83, 0x398ecf},
				{  336,   96, 0x7bb1db},
				{  335,  103, 0xffffff},
				{  334,  109, 0xffffff},
				{  325,  112, 0x519ad2},
				{  342,  134, 0x1b82d2},
				{  312,  125, 0xffffff},
				},90,{275, 61, 392, 154})
		if x>0 then
			tool.alert("向上滑",1)
			tool.move(490,  760,40,480, 1224,10)
			tool.sleep(1)
		end
		x,y=tool.findColor({
				{  658,  512, 0x2fad94},
				{  655,  530, 0x29ab91},
				{  667,  542, 0x70c7b6},
				{  677,  558, 0x88d1c2},
				{  673,  563, 0x74c9b8},
				{  657,  559, 0x2aab91},
				{  697,  542, 0x29ab91},
				{  662,  594, 0x333333},
				},90,{107, 153, 856, 1500})
		if x>0 then
			tool.sleep(1)
			tool.alert("进入蚂蚁森林"..x.." "..y)
			tool.tap(x , y)
		end
		x,y=tool.findColor({
				{  809, 1450, 0x277ab6},
				{  827, 1460, 0x56b6fb},
				{  843, 1548, 0x277ab6},
				{  948, 1500, 0xffcf1e},
				{  981, 1506, 0x564335},
				{  983, 1497, 0xff4e31},
				{ 1002, 1476, 0x564335},
				{ 1013, 1534, 0xd6a122},
				},90,{741, 1422, 1054, 1584})
		if x>0 then
			tool.alert("开始收集自己的能量")
			for a=160,926,80 do
				for b=548 ,833,80 do
					--tool.alert(a.." "..b)
					tool.tap(a,b)
				end
			end
			--tool.alert("Again",1)
			for a=160,926,80 do
				for b=548 ,833,80 do
					--tool.alert(a.." "..b)
					tool.tap(a,b)
				end
			end
			tool.sleep(1)
			tool.move(456, 1852,80,512,  80,10)
			tool.sleep(1)
		end
		--不小心进入动态
		x,y=tool.findColor({
				{   58,  120, 0x108ee9},
				{   45,  106, 0x108ee9},
				{   59,   92, 0xafd9f8},
				{  113,   99, 0x3e3e3e},
				{  166,   85, 0x4f4f4f},
				{  167,  109, 0x7f7f7f},
				{  176,  115, 0x323232},
				{  136,   89, 0x111111},
				},90,{7, 59, 205, 150})
		if x>0 then
			tool.alert("动态",1)
			tool.tap( 44,  106)
			tool.sleep(1)
		end
	end
end
function more_friends()
	if tool.isFrontApp("com.eg.android.AlipayGphone") then
		--滑到底点击查看更多好友，识别左上角蚂蚁森林
		x,y=tool.findColor({
				{   51,   86, 0x151515},
				{   54,   96, 0xffffff},
				{   47,  101, 0xffffff},
				{   52,  107, 0x111111},
				{   71,  103, 0x111111},
				{   89,  101, 0x6c6c6c},
				{  110,   94, 0x111111},
				{  145,   93, 0x111111},
				},90,{27, 76, 224, 131})
		if x>0 then
			tool.move(456, 1852,80,512, 580,10)
			tool.sleep(1)
		end
		x,y=tool.findColor({
				{  428,  439, 0x323232},
				{  413,  463, 0x323232},
				{  430,  464, 0xf8f8f8},
				{  478,  466, 0xfefefe},
				{  515,  456, 0x979797},
				{  562,  447, 0xf4f4f4},
				{  619,  457, 0x696969},
				{  666,  474, 0x323232},
				},90,{350, 178, 722, 1634})
		if x>0 then
			tool.alert("查看更多好友")
			tool.tap(x,y,3)
		end
		x,y=tool.findColor({
				{   77,  226, 0xf9c800},
				{   54,  226, 0xf9c800},
				{  106,  219, 0xf9c800},
				{  129,  266, 0xd6451d},
				{   92,  282, 0xe47755},
				{  116,  298, 0xd6441b},
				{   48,  312, 0xffffff},
				{   27,  280, 0xdc5f3c},
				},90,{0, 188, 161, 364})
		if x>0 then
			tool.alert("退出合种树")
			tool.tap(47,  109)
		end
		--不小心点到地图
		x,y=tool.findColor({
				{  108,   93, 0xa5ccfe},
				{  114,   92, 0xbad8ff},
				{  119,   92, 0x66a9fe},
				{  144,   95, 0xb5d6ff},
				{  146,  100, 0x73b1fe},
				{  173,  106, 0x66aafe},
				{  183,  106, 0xffffff},
				{  178,   98, 0xbddaff},
				},90,{82, 62, 214, 146})
		if x>0 then
			tool.alert("不小心点到地图了")
			tool.tap(42,  102,1)
		end
		x,y=tool.findColor({
				{  473, 1859, 0x333333},
				{  469, 1870, 0x696969},
				{  488, 1878, 0x333333},
				{  508, 1855, 0x333333},
				{  571, 1855, 0x333333},
				{  570, 1872, 0x333333},
				{  534, 1878, 0x414141},
				{  603, 1867, 0x333333},
				},90,{426, 1841, 649, 1901})
		if x>0 then
			tool.alert("10秒后继续",10)
			tool.tap(1016,  105,2)
		end
	end
end
function findHand()
	if tool.isFrontApp("com.eg.android.AlipayGphone") then
		x,y=tool.findColor({
				{   60,   90, 0x1992ea},
				{   43,  103, 0x108ee9},
				{   56,  118, 0x108ee9},
				{  116,  101, 0x111111},
				{  167,   94, 0x111111},
				{  196,  104, 0x757575},
				{  220,  110, 0x676767},
				{  135,  107, 0x4c4c4c},
				},90,{33, 78, 324, 139})
		if x>0 then
			Point = {
				{{{ 1042,  507, 0xa7cdb7},{ 1048,  517, 0x67a885},{ 1051,  509, 0xc9e1d4},{ 1058,  510, 0xcce3d6},{ 1067,  510, 0x5ea47e},{ 1066,  540, 0x72b08e},{ 1059,  540, 0x1da06d},{ 1043,  525, 0xfefefe}},980, 326, 1078, 1910,1,85,"找到手"},
				{{{ 1032,  523, 0xf99137},{ 1046,  534, 0xf99137},{ 1050,  531, 0xfbbc85},{ 1067,  527, 0xffffff},{ 1066,  557, 0xf99137},{ 1059,  539, 0xf99137},{ 1054,  545, 0xfddcbe},{ 1057,  562, 0xf99137}},980, 326, 1078, 1910,1,85,"找到爱心"},
			}
			local x, y= -1, -1
			for i, v in ipairs(Point) do
				x, y = tool.findColor(v[1], v[7], {v[2], v[3], v[4], v[5]})
				if x > 0 then
					tool.alert(v[8])
					tool.tap(x-500,y+5,1)
					return true
				else
					tool.alert("继续滑")
					tool.move(480, 1424,40,490,  760,10)
					tool.sleep(1.5)
				end
			end
		end
	end
end
function collect()
	if tool.isFrontApp("com.eg.android.AlipayGphone") then
		x,y=tool.findColor({
				{ 1006, 1485, 0x36bbff},
				{  993, 1491, 0x36bbff},
				{  976, 1489, 0x85d6ff},
				{  988, 1501, 0x3bbcff},
				{  844, 1489, 0xfa9137},
				{  800, 1490, 0xfa9137},
				{  649, 1492, 0x5891e8},
				{  687, 1484, 0x8cd8ff},
				},90,{583, 1423, 1043, 1577})
		if x>0 then
--			tool.alert("返回",1)
--			tool.tap(42,  102)
--				tool.sleep(2)
			for a=160,926,80 do
				for b=548 ,833,80 do
					--tool.alert(a.." "..b)
					tool.tap(a,b)
				end
			end
			tool.alert("收取完毕")
			tool.tap(42,  102,1)
		end
	end
end
function run()
	key=1
	tool.runApp("com.eg.android.AlipayGphone")
	tool.initScreen(0)
	t1=tool.time()
	while (true) do
		::continue::
		if mayi() then goto continue end  --进入蚂蚁森林
		if more_friends() then goto continue end --点击更多好友
		if findHand() then goto continue end --找手
		if collect() then goto continue end --收集
		--tool.alert("key="..key)
		key=key+1
		if  key==200 then  --如果卡在未知界面200s，将结束app，重新打开app。
			tool.closeApp("com.eg.android.AlipayGphone")
			tool.sleep(2) 
			tool.runApp("com.eg.android.AlipayGphone")
			key=1
		end
		t2=tool.time()
		tool.alert("运行了："..t2-t1.." s")
		if (t2-t1)>2200 then                --脚本运行2200秒结束脚本
			tool.alert("收手了,脚本结束。",2)
			tool.exit()
		end
	end 
end
run()
