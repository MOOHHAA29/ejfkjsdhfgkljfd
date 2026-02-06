wait(5)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local mouse = player:GetMouse()
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ObjectLearningUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 620)
mainFrame.Position = UDim2.new(0, 10, 0.5, -310)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = false
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(100, 200, 255)
uiStroke.Thickness = 2
uiStroke.Parent = mainFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
toggleButton.Text = "❌"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 20
toggleButton.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 10)
toggleCorner.Parent = toggleButton

local dragHandle = Instance.new("Frame")
dragHandle.Size = UDim2.new(1, 0, 0, 60)
dragHandle.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
dragHandle.BorderSizePixel = 0
dragHandle.Parent = mainFrame

local dragCorner = Instance.new("UICorner")
dragCorner.CornerRadius = UDim.new(0, 12)
dragCorner.Parent = dragHandle

local dragIcon = Instance.new("TextLabel")
dragIcon.Size = UDim2.new(0, 40, 1, 0)
dragIcon.Position = UDim2.new(0, 10, 0, 0)
dragIcon.BackgroundTransparency = 1
dragIcon.Text = "☰"
dragIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
dragIcon.Font = Enum.Font.GothamBold
dragIcon.TextSize = 24
dragIcon.Parent = dragHandle

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 50, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🎮 تعلم أسماء العناصر"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = dragHandle

local backButton = Instance.new("TextButton")
backButton.Size = UDim2.new(0, 80, 0, 40)
backButton.Position = UDim2.new(0, 15, 0, 70)
backButton.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
backButton.Text = "⬅️ رجوع"
backButton.TextColor3 = Color3.fromRGB(255, 255, 255)
backButton.Font = Enum.Font.GothamBold
backButton.TextSize = 14
backButton.Visible = false
backButton.Parent = mainFrame

local backCorner = Instance.new("UICorner")
backCorner.CornerRadius = UDim.new(0, 8)
backCorner.Parent = backButton

-- إطار المسار الكامل (محسّن)
local pathFrame = Instance.new("ScrollingFrame")
pathFrame.Size = UDim2.new(1, -110, 0, 40)
pathFrame.Position = UDim2.new(0, 100, 0, 70)
pathFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
pathFrame.BorderSizePixel = 0
pathFrame.ScrollBarThickness = 4
pathFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 255)
pathFrame.ScrollingDirection = Enum.ScrollingDirection.X
pathFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
pathFrame.Visible = false
pathFrame.Parent = mainFrame

local pathCorner = Instance.new("UICorner")
pathCorner.CornerRadius = UDim.new(0, 8)
pathCorner.Parent = pathFrame

local pathContainer = Instance.new("Frame")
pathContainer.Size = UDim2.new(0, 0, 1, 0)
pathContainer.BackgroundTransparency = 1
pathContainer.AutomaticSize = Enum.AutomaticSize.X
pathContainer.Parent = pathFrame

local pathLayout = Instance.new("UIListLayout")
pathLayout.FillDirection = Enum.FillDirection.Horizontal
pathLayout.SortOrder = Enum.SortOrder.LayoutOrder
pathLayout.Padding = UDim.new(0, 5)
pathLayout.Parent = pathContainer

local pathPadding = Instance.new("UIPadding")
pathPadding.PaddingLeft = UDim.new(0, 10)
pathPadding.PaddingRight = UDim.new(0, 10)
pathPadding.Parent = pathContainer

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -30, 0, 45)
searchBox.Position = UDim2.new(0, 15, 0, 75)
searchBox.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
searchBox.PlaceholderText = "🔍 ابحث عن عنصر..."
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 16
searchBox.ClearTextOnFocus = false
searchBox.Parent = mainFrame

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 8)
searchCorner.Parent = searchBox

local searchStroke = Instance.new("UIStroke")
searchStroke.Color = Color3.fromRGB(60, 60, 70)
searchStroke.Thickness = 1
searchStroke.Parent = searchBox

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -30, 1, -290)
scrollFrame.Position = UDim2.new(0, 15, 0, 130)
scrollFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 8
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 255)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.Parent = mainFrame

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 8)
scrollCorner.Parent = scrollFrame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 8)
listLayout.Parent = scrollFrame

local listPadding = Instance.new("UIPadding")
listPadding.PaddingTop = UDim.new(0, 8)
listPadding.PaddingBottom = UDim.new(0, 8)
listPadding.PaddingLeft = UDim.new(0, 8)
listPadding.PaddingRight = UDim.new(0, 8)
listPadding.Parent = scrollFrame

-- صندوق المعلومات (محسّن مع مسار كامل)
local infoBox = Instance.new("Frame")
infoBox.Size = UDim2.new(1, -30, 0, 130)
infoBox.Position = UDim2.new(0, 15, 1, -180)
infoBox.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
infoBox.BorderSizePixel = 0
infoBox.Parent = mainFrame

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 8)
infoCorner.Parent = infoBox

local infoStroke = Instance.new("UIStroke")
infoStroke.Color = Color3.fromRGB(255, 200, 0)
infoStroke.Thickness = 2
infoStroke.Parent = infoBox

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(1, -20, 0, 25)
infoTitle.Position = UDim2.new(0, 10, 0, 5)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = "📦 العنصر المحدد"
infoTitle.TextColor3 = Color3.fromRGB(255, 200, 0)
infoTitle.Font = Enum.Font.GothamBold
infoTitle.TextSize = 14
infoTitle.TextXAlignment = Enum.TextXAlignment.Left
infoTitle.Parent = infoBox

local infoScrollFrame = Instance.new("ScrollingFrame")
infoScrollFrame.Size = UDim2.new(1, -20, 1, -35)
infoScrollFrame.Position = UDim2.new(0, 10, 0, 30)
infoScrollFrame.BackgroundTransparency = 1
infoScrollFrame.BorderSizePixel = 0
infoScrollFrame.ScrollBarThickness = 5
infoScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 255)
infoScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
infoScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
infoScrollFrame.Parent = infoBox

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, -15, 0, 0)
infoText.BackgroundTransparency = 1
infoText.Text = "اضغط على أي عنصر في العالم\nلمعرفة اسمه ونوعه والمسار الكامل"
infoText.TextColor3 = Color3.fromRGB(200, 200, 200)
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 11
infoText.TextWrapped = true
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.AutomaticSize = Enum.AutomaticSize.Y
infoText.Parent = infoScrollFrame

local counterLabel = Instance.new("TextLabel")
counterLabel.Size = UDim2.new(1, 0, 0, 40)
counterLabel.Position = UDim2.new(0, 0, 1, -40)
counterLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
counterLabel.Text = "📊 عدد العناصر: 0"
counterLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
counterLabel.Font = Enum.Font.GothamBold
counterLabel.TextSize = 14
counterLabel.BorderSizePixel = 0
counterLabel.Parent = mainFrame

local counterCorner = Instance.new("UICorner")
counterCorner.CornerRadius = UDim.new(0, 12)
counterCorner.Parent = counterLabel

local currentHighlight = nil
local lastClickedObject = nil
local currentParent = game.Workspace
local navigationHistory = {}
local childCountCache = {}

local dragging = false
local dragInput
local dragStart
local startPos

local function updateDrag(input)
	local delta = input.Position - dragStart
	mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

dragHandle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

dragHandle.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		updateDrag(input)
	end
end)

local objectColors = {
	Part = Color3.fromRGB(52, 152, 219),
	MeshPart = Color3.fromRGB(155, 89, 182),
	UnionOperation = Color3.fromRGB(230, 126, 34),
	Model = Color3.fromRGB(46, 204, 113),
	Tool = Color3.fromRGB(231, 76, 60),
	Light = Color3.fromRGB(241, 196, 15),
	Sound = Color3.fromRGB(26, 188, 156),
	Attachment = Color3.fromRGB(149, 165, 166),
	Folder = Color3.fromRGB(52, 73, 94),
	Script = Color3.fromRGB(192, 57, 43),
	LocalScript = Color3.fromRGB(142, 68, 173)
}

local objectIcons = {
	Part = "🟦",
	MeshPart = "🟪",
	UnionOperation = "🟧",
	Model = "📦",
	Tool = "🔧",
	Light = "💡",
	Sound = "🔊",
	Attachment = "📎",
	Folder = "📁",
	Script = "📜",
	LocalScript = "📝"
}

-- دالة لترتيب العناصر حسب النوع
local function getSortPriority(className)
	-- المجموعة الأولى: الحاويات (Models, Folders, Tools)
	if className == "Model" then return 1
	elseif className == "Folder" then return 2
	elseif className == "Tool" then return 3
		-- المجموعة الثانية: الأجزاء (Parts)
	elseif className == "Part" then return 4
	elseif className == "MeshPart" then return 5
	elseif className == "UnionOperation" then return 6
		-- المجموعة الثالثة: السكريبتات
	elseif className == "Script" then return 7
	elseif className == "LocalScript" then return 8
		-- المجموعة الرابعة: باقي العناصر
	elseif className == "Light" or className:find("Light") then return 9
	elseif className == "Sound" then return 10
	elseif className == "Attachment" then return 11
	else return 12 -- أي شيء آخر
	end
end

-- دالة للحصول على المسار الكامل بشكل منظم
local function getFullPath(object)
	local pathParts = {}
	local current = object

	while current and current ~= game do
		table.insert(pathParts, 1, current.Name)
		current = current.Parent
	end

	return pathParts
end

-- دالة لعرض المسار بشكل جميل
local function formatPath(pathParts)
	local formattedPath = "🌳 "
	for i, part in ipairs(pathParts) do
		if i > 1 then
			formattedPath = formattedPath .. " ➜ "
		end
		formattedPath = formattedPath .. part
	end
	return formattedPath
end

-- دالة للحصول على معلومات الـ Parent
local function getParentInfo(object)
	local info = ""
	local current = object.Parent
	local level = 1

	while current and current ~= game and level <= 5 do
		local indent = string.rep("  ", level)
		info = info .. indent .. "⬆️ Parent " .. level .. ": " .. current.Name .. " (" .. current.ClassName .. ")\n"
		current = current.Parent
		level = level + 1
	end

	return info
end

-- دالة لإنشاء مسار قابل للنقر
local function createClickablePath(object)
	-- مسح المسار القديم
	for _, child in pairs(pathContainer:GetChildren()) do
		if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
			child:Destroy()
		end
	end

	local pathParts = getFullPath(object)
	local currentObj = game

	-- إيجاد الـ object الحالي في الشجرة
	for i, partName in ipairs(pathParts) do
		if i > 1 then -- تخطي "game"
			currentObj = currentObj:FindFirstChild(partName)
			if not currentObj then break end
		end
	end

	-- إنشاء الأزرار
	local objects = {}
	currentObj = game
	for i, partName in ipairs(pathParts) do
		if i > 1 then
			currentObj = currentObj:FindFirstChild(partName)
			if currentObj then
				table.insert(objects, currentObj)
			end
		end
	end

	-- أيقونة البداية
	local startIcon = Instance.new("TextLabel")
	startIcon.Size = UDim2.new(0, 25, 1, 0)
	startIcon.BackgroundTransparency = 1
	startIcon.Text = "🌳"
	startIcon.TextSize = 14
	startIcon.LayoutOrder = 0
	startIcon.Parent = pathContainer

	-- إنشاء زر لكل جزء من المسار
	for i, obj in ipairs(objects) do
		-- السهم
		if i > 1 or pathParts[1] then
			local arrow = Instance.new("TextLabel")
			arrow.Size = UDim2.new(0, 20, 1, 0)
			arrow.BackgroundTransparency = 1
			arrow.Text = "➜"
			arrow.TextColor3 = Color3.fromRGB(100, 200, 255)
			arrow.TextSize = 12
			arrow.LayoutOrder = (i * 2) - 1
			arrow.Parent = pathContainer
		end

		-- الزر
		local btn = Instance.new("TextButton")
		btn.AutomaticSize = Enum.AutomaticSize.X
		btn.Size = UDim2.new(0, 0, 0, 28)
		btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
		btn.Text = " " .. obj.Name .. " "
		btn.TextColor3 = Color3.fromRGB(200, 200, 200)
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 11
		btn.LayoutOrder = i * 2
		btn.Parent = pathContainer

		local btnCorner = Instance.new("UICorner")
		btnCorner.CornerRadius = UDim.new(0, 4)
		btnCorner.Parent = btn

		local btnPadding = Instance.new("UIPadding")
		btnPadding.PaddingLeft = UDim.new(0, 6)
		btnPadding.PaddingRight = UDim.new(0, 6)
		btnPadding.Parent = btn

		-- تلوين الزر الأخير (العنصر الحالي)
		if i == #objects then
			btn.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
			btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		end

		-- عند النقر على الزر
		btn.MouseButton1Click:Connect(function()
			if obj ~= object and (obj:IsA("Model") or obj:IsA("Folder") or obj:IsA("Tool")) then
				navigateInto(obj)
			end
		end)

		btn.MouseEnter:Connect(function()
			if i ~= #objects then
				btn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
			end
		end)

		btn.MouseLeave:Connect(function()
			if i ~= #objects then
				btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
			end
		end)
	end

	-- تحديث حجم Canvas
	task.wait()
	pathFrame.CanvasSize = UDim2.new(0, pathContainer.AbsoluteSize.X + 20, 0, 0)
end

-- دالة لإنشاء قائمة الأبناء القابلة للنقر في صندوق المعلومات
local function createChildrenList(object)
	local childrenText = ""

	if object:IsA("Model") or object:IsA("Folder") or object:IsA("Tool") then
		local children = {}
		for _, child in pairs(object:GetChildren()) do
			local isPlayer = false
			local parent = child
			while parent and parent ~= game.Workspace do
				if parent:IsA("Model") and Players:GetPlayerFromCharacter(parent) then
					isPlayer = true
					break
				end
				parent = parent.Parent
			end
			if not isPlayer then
				table.insert(children, child)
			end
		end

		if #children > 0 then
			childrenText = "\n\n👶 الأبناء (" .. #children .. "):\n"
			for i, child in ipairs(children) do
				if i <= 10 then -- عرض أول 10 فقط
					local icon = objectIcons[child.ClassName] or "📄"
					childrenText = childrenText .. "   " .. icon .. " " .. child.Name .. " (" .. child.ClassName .. ")\n"
				elseif i == 11 then
					childrenText = childrenText .. "   ... و " .. (#children - 10) .. " عناصر أخرى\n"
					break
				end
			end
			childrenText = childrenText .. "\n💡 اضغط على العنصر مرة ثانية للدخول واستكشاف الأبناء"
		end
	end

	return childrenText
end

local function getChildCount(object)
	if childCountCache[object] then
		return childCountCache[object]
	end

	local count = 0
	for _, child in pairs(object:GetChildren()) do
		local isPlayer = false
		local parent = child
		while parent and parent ~= game.Workspace do
			if parent:IsA("Model") and Players:GetPlayerFromCharacter(parent) then
				isPlayer = true
				break
			end
			parent = parent.Parent
		end
		if not isPlayer then
			count = count + 1
		end
	end

	childCountCache[object] = count
	return count
end

local function clearCache()
	childCountCache = {}
end

local function getAllObjects(parent)
	local objects = {}

	for _, obj in pairs(parent:GetChildren()) do
		local isPlayer = false
		local checkParent = obj
		while checkParent and checkParent ~= game.Workspace do
			if checkParent:IsA("Model") and Players:GetPlayerFromCharacter(checkParent) then
				isPlayer = true
				break
			end
			checkParent = checkParent.Parent
		end

		if not isPlayer then
			table.insert(objects, obj)
		end
	end

	return objects
end

local function navigateInto(object)
	table.insert(navigationHistory, currentParent)
	currentParent = object
	backButton.Visible = true
	pathFrame.Visible = true
	searchBox.Position = UDim2.new(0, 15, 0, 120)
	scrollFrame.Position = UDim2.new(0, 15, 0, 175)
	scrollFrame.Size = UDim2.new(1, -30, 1, -335)

	createClickablePath(object)

	updateList("")
	searchBox.Text = ""
end

local function navigateBack()
	if #navigationHistory > 0 then
		currentParent = navigationHistory[#navigationHistory]
		table.remove(navigationHistory, #navigationHistory)

		if #navigationHistory == 0 then
			backButton.Visible = false
			pathFrame.Visible = false
			searchBox.Position = UDim2.new(0, 15, 0, 75)
			scrollFrame.Position = UDim2.new(0, 15, 0, 130)
			scrollFrame.Size = UDim2.new(1, -30, 1, -290)
		else
			createClickablePath(currentParent)
		end

		updateList("")
		searchBox.Text = ""
	end
end

backButton.MouseButton1Click:Connect(function()
	navigateBack()
end)

local function createListItem(object, index)
	local item = Instance.new("TextButton")
	item.Size = UDim2.new(1, -16, 0, 50)
	item.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
	item.Text = ""
	item.AutoButtonColor = false
	item.Parent = scrollFrame

	-- ترتيب العنصر حسب النوع ثم الاسم
	local priority = getSortPriority(object.ClassName)
	item.LayoutOrder = (priority * 10000) + index

	local itemCorner = Instance.new("UICorner")
	itemCorner.CornerRadius = UDim.new(0, 6)
	itemCorner.Parent = item

	local icon = Instance.new("TextLabel")
	icon.Size = UDim2.new(0, 35, 1, 0)
	icon.BackgroundTransparency = 1
	icon.Text = objectIcons[object.ClassName] or "📄"
	icon.TextSize = 20
	icon.Parent = item

	local className = Instance.new("TextLabel")
	className.Size = UDim2.new(0, 110, 0, 16)
	className.Position = UDim2.new(0, 40, 0, 4)
	className.BackgroundTransparency = 1
	className.Text = object.ClassName
	className.TextColor3 = objectColors[object.ClassName] or Color3.fromRGB(200, 200, 200)
	className.Font = Enum.Font.GothamBold
	className.TextSize = 11
	className.TextXAlignment = Enum.TextXAlignment.Left
	className.Parent = item

	local objectName = Instance.new("TextLabel")
	objectName.Size = UDim2.new(1, -150, 0, 22)
	objectName.Position = UDim2.new(0, 40, 0, 22)
	objectName.BackgroundTransparency = 1
	objectName.Text = object.Name
	objectName.TextColor3 = Color3.fromRGB(255, 255, 255)
	objectName.Font = Enum.Font.Gotham
	objectName.TextSize = 14
	objectName.TextXAlignment = Enum.TextXAlignment.Left
	objectName.TextTruncate = Enum.TextTruncate.AtEnd
	objectName.Parent = item

	local hasChildren = object:IsA("Model") or object:IsA("Folder") or object:IsA("Tool")

	if hasChildren then
		local childCount = getChildCount(object)
		if childCount > 0 then
			-- عرض عدد الأبناء فقط
			local childLabel = Instance.new("TextLabel")
			childLabel.Size = UDim2.new(0, 65, 0, 32)
			childLabel.Position = UDim2.new(1, -73, 0.5, -16)
			childLabel.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
			childLabel.Text = "📂 " .. childCount
			childLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			childLabel.Font = Enum.Font.GothamBold
			childLabel.TextSize = 12
			childLabel.Parent = item

			local labelCorner = Instance.new("UICorner")
			labelCorner.CornerRadius = UDim.new(0, 6)
			labelCorner.Parent = childLabel
		end
	end

	item.MouseEnter:Connect(function()
		item.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
		-- تغيير الـ cursor إذا كان فيه أبناء
		if hasChildren and getChildCount(object) > 0 then
			item.BackgroundColor3 = Color3.fromRGB(55, 130, 100)
		end
	end)

	item.MouseLeave:Connect(function()
		item.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
	end)

	item.MouseButton1Click:Connect(function()
		if object.Parent then
			-- إذا كان العنصر يحتوي على أبناء، ادخل جواه مباشرة
			if hasChildren and getChildCount(object) > 0 then
				navigateInto(object)
			else
				-- إذا ما فيه أبناء، عرض المعلومات فقط
				if currentHighlight then
					currentHighlight:Destroy()
					currentHighlight = nil
				end

				-- الحصول على المسار الكامل
				local pathParts = getFullPath(object)
				local fullPathText = formatPath(pathParts)

				-- الحصول على معلومات الـ Parent
				local parentInfo = getParentInfo(object)

				-- الحصول على قائمة الأبناء
				local childrenInfo = createChildrenList(object)

				-- عرض جميع المعلومات بشكل منظم
				infoText.Text = "🏷️ النوع: " .. object.ClassName .. "\n" ..
					"📝 الاسم: " .. object.Name .. "\n\n" ..
					"📍 المسار الكامل:\n" .. fullPathText .. "\n\n" ..
					"📊 تسلسل الـ Parents:\n" .. parentInfo .. childrenInfo

				if object:IsA("BasePart") or object:IsA("Model") then
					local highlight = Instance.new("SelectionBox")
					highlight.Adornee = object
					highlight.Parent = object
					highlight.LineThickness = 0.15
					highlight.Color3 = objectColors[object.ClassName] or Color3.fromRGB(255, 255, 0)
					highlight.SurfaceColor3 = objectColors[object.ClassName] or Color3.fromRGB(255, 255, 0)
					highlight.SurfaceTransparency = 0.9
					currentHighlight = highlight
				end

				lastClickedObject = object
			end
		end
	end)

	return item
end

function updateList(searchTerm)
	for _, child in pairs(scrollFrame:GetChildren()) do
		if child:IsA("TextButton") or child:IsA("TextLabel") then
			child:Destroy()
		end
	end

	local objects = getAllObjects(currentParent)
	local count = 0

	searchTerm = searchTerm:lower()

	-- ترتيب العناصر أبجدياً داخل كل مجموعة
	table.sort(objects, function(a, b)
		local priorityA = getSortPriority(a.ClassName)
		local priorityB = getSortPriority(b.ClassName)
		if priorityA == priorityB then
			return a.Name:lower() < b.Name:lower()
		end
		return priorityA < priorityB
	end)

	-- تتبع آخر فئة تم عرضها لإضافة العناوين
	local lastCategory = nil
	local categoryNames = {
		[1] = "📦 Models",
		[2] = "📁 Folders", 
		[3] = "🔧 Tools",
		[4] = "🟦 Parts",
		[7] = "📜 Scripts",
		[9] = "💡 Lights & Effects",
		[10] = "🔊 Sounds",
		[11] = "📎 Attachments",
		[12] = "📄 Other"
	}

	for index, obj in pairs(objects) do
		if obj and obj.Parent then
			local fullName = (obj.ClassName .. " " .. obj.Name):lower()

			if searchTerm == "" or fullName:find(searchTerm, 1, true) then
				local priority = getSortPriority(obj.ClassName)

				-- إضافة عنوان الفئة إذا كانت جديدة
				if searchTerm == "" and priority ~= lastCategory then
					local categoryHeader = Instance.new("TextLabel")
					categoryHeader.Size = UDim2.new(1, -16, 0, 30)
					categoryHeader.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
					categoryHeader.Text = categoryNames[priority] or "📄 Other"
					categoryHeader.TextColor3 = Color3.fromRGB(100, 200, 255)
					categoryHeader.Font = Enum.Font.GothamBold
					categoryHeader.TextSize = 13
					categoryHeader.TextXAlignment = Enum.TextXAlignment.Left
					categoryHeader.LayoutOrder = (priority * 10000) - 1
					categoryHeader.Parent = scrollFrame

					local headerCorner = Instance.new("UICorner")
					headerCorner.CornerRadius = UDim.new(0, 6)
					headerCorner.Parent = categoryHeader

					local headerPadding = Instance.new("UIPadding")
					headerPadding.PaddingLeft = UDim.new(0, 10)
					headerPadding.Parent = categoryHeader

					lastCategory = priority
				end

				createListItem(obj, index)
				count = count + 1
			end
		end
	end

	counterLabel.Text = "📊 عدد العناصر: " .. count
	scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 16)
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	updateList(searchBox.Text)
end)

local isVisible = true
toggleButton.MouseButton1Click:Connect(function()
	isVisible = not isVisible
	mainFrame.Visible = isVisible
	toggleButton.Text = isVisible and "❌" or "📋"
	toggleButton.BackgroundColor3 = isVisible and Color3.fromRGB(100, 200, 255) or Color3.fromRGB(46, 204, 113)
end)

mouse.Button1Down:Connect(function()
	local target = mouse.Target

	if target then
		local isPlayerPart = false
		local parent = target
		while parent and parent ~= game.Workspace do
			if parent:IsA("Model") and Players:GetPlayerFromCharacter(parent) then
				isPlayerPart = true
				break
			end
			parent = parent.Parent
		end

		if not isPlayerPart then
			if lastClickedObject == target and currentHighlight then
				currentHighlight:Destroy()
				currentHighlight = nil
				lastClickedObject = nil
				infoText.Text = "اضغط على أي عنصر في العالم\nلمعرفة اسمه ونوعه والمسار الكامل"
			else
				if currentHighlight then
					currentHighlight:Destroy()
					currentHighlight = nil
				end

				-- الحصول على المسار الكامل
				local pathParts = getFullPath(target)
				local fullPathText = formatPath(pathParts)

				-- الحصول على معلومات الـ Parent
				local parentInfo = getParentInfo(target)

				-- الحصول على قائمة الأبناء
				local childrenInfo = createChildrenList(target)

				infoText.Text = "🏷️ النوع: " .. target.ClassName .. "\n" ..
					"📝 الاسم: " .. target.Name .. "\n\n" ..
					"📍 المسار الكامل:\n" .. fullPathText .. "\n\n" ..
					"📊 تسلسل الـ Parents:\n" .. parentInfo .. childrenInfo

				local highlight = Instance.new("SelectionBox")
				highlight.Adornee = target
				highlight.Parent = target
				highlight.LineThickness = 0.15
				highlight.Color3 = objectColors[target.ClassName] or Color3.fromRGB(0, 255, 100)
				highlight.SurfaceColor3 = objectColors[target.ClassName] or Color3.fromRGB(0, 255, 100)
				highlight.SurfaceTransparency = 0.9
				currentHighlight = highlight
				lastClickedObject = target
			end
		end
	end
end)

spawn(function()
	while wait(10) do
		if isVisible and currentParent then
			clearCache()
		end
	end
end)

updateList("")
