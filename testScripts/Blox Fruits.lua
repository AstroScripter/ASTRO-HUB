local function ASTROHUB()
    local Player = game:GetService('Players').LocalPlayer
    local gameName = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name
    local Themes = {
        MainFrame = Color3.fromRGB(30, 30, 30),
		Minimise = Color3.fromRGB(255, 106, 0),
		MinimiseAccent = Color3.fromRGB(147, 59, 0),
		Maximise = Color3.fromRGB(25, 255, 0),
		MaximiseAccent = Color3.fromRGB(0, 255, 110),
		Delete = Color3.fromRGB(255, 0, 0),
		DeleteAccent = Color3.fromRGB(147, 0, 0),
		Time = Color3.fromRGB(255, 255, 255),
		NavBar = Color3.fromRGB(55, 55, 55),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		TitleBar = Color3.fromRGB(30, 30, 30),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(175, 175, 175),
		Banner = Color3.fromRGB(55, 55, 55),
		BannerAccent = Color3.fromRGB(255, 255, 255),
		Content = Color3.fromRGB(85, 85, 85),
		Button = Color3.fromRGB(85, 85, 85),
		ButtonAccent = Color3.fromRGB(255, 255, 255),
		ChipSet = Color3.fromRGB(235, 235, 235),
		ChipSetAccent = Color3.fromRGB(85, 85, 85),
		DataTable = Color3.fromRGB(235, 235, 235),
		DataTableAccent = Color3.fromRGB(85, 85, 85),
		Slider = Color3.fromRGB(85, 85, 85),
		SliderAccent = Color3.fromRGB(235, 235, 235),
		Toggle = Color3.fromRGB(205, 205, 205),
		ToggleAccent = Color3.fromRGB(125, 125, 125),
		Dropdown = Color3.fromRGB(85, 85, 85),
		DropdownAccent = Color3.fromRGB(235, 235, 235),
		ColorPicker = Color3.fromRGB(85, 85, 85),
		ColorPickerAccent = Color3.fromRGB(235, 235, 235),
		TextField = Color3.fromRGB(175, 175, 175),
		TextFieldAccent = Color3.fromRGB(255, 255, 255),
    }

    local Types = {
		"RoundFrame",
		"Shadow",
		"Circle",
		"CircleButton",
		"Frame",
		"Label",
		"Button",
		"SmoothButton",
		"Box",
		"ScrollingFrame",
		"NavBar",
		"Menu",
    }
    
	local ActualTypes = {
		RoundFrame = "ImageLabel",
		Shadow = "ImageLabel",
		Circle = "ImageLabel",
		CircleButton = "ImageButton",
		Frame = "Frame",
		Label = "TextLabel",
		Button = "TextButton",
		SmoothButton = "ImageButton",
		Box = "TextBox",
		ScrollingFrame = "ScrollingFrame",
		NavBar = "ImageButton",
		Menu = "ImageButton",
	}

	local Properties = {
		RoundFrame = {
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554237731",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(3, 3, 297, 297)
		},
		SmoothButton = {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554237731",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(3, 3, 297, 297)
		},
		Shadow = {
			Name = "Shadow",
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554236805",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(23, 23, 277, 277),
			Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
			Position = UDim2.fromOffset(-15, -15)
		},
		Circle = {
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554831670"
		},
		CircleButton = {
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			Image = "http://www.roblox.com/asset/?id=5554831670"
		},
		Frame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		},
		Label = {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(5, 0),
			Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left
		},
		Button = {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(5, 0),
			Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left
		},
		Box = {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(5, 0),
			Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left
		},
		ScrollingFrame = {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			CanvasSize = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, 1)
		},
		Menu = {
			Name = "More",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5555108481",
			Size = UDim2.fromOffset(20, 20),
			Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(25, 10)
		},
		NavBar = {
			Name = "SheetToggle",
			Image = "http://www.roblox.com/asset/?id=5576439039",
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(20, 20),
			Position = UDim2.fromOffset(5, 5),
			AutoButtonColor = false
		},
	}

	local function FindType(String)
		for _, Type in next, Types do
			if Type:sub(1, #String):lower() == String:lower() then
				return Type
			end
		end
		return false
	end

	local Objects = {}
	function Objects.new(Type)
		local TargetType = FindType(Type)
		if TargetType then
			local NewImage = Instance.new(ActualTypes[TargetType])
			if Properties[TargetType] then
				for Property, Value in next, Properties[TargetType] do
					NewImage[Property] = Value
				end
			end
			return NewImage
		else
			return Instance.new(Type)
		end
	end

	local function GetXY(GuiObject)
		local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
		local Px, Py = math.clamp(Player:GetMouse().X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Player:GetMouse().Y - GuiObject.AbsolutePosition.Y, 0, May)
		return Px / Max, Py / May
	end

	local function CircleAnim(GuiObject, EndColour, StartColour)
		local PX, PY = GetXY(GuiObject)
		local Circle = Objects.new("Circle")
		Circle.Size = UDim2.fromScale(0, 0)
		Circle.Position = UDim2.fromScale(PX, PY)
		Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
		Circle.ZIndex = 200
		Circle.Parent = GuiObject
		local Size = GuiObject.AbsoluteSize.X
		game:GetService("TweenService"):Create(Circle, TweenInfo.new(1), { Position = UDim2.fromScale(PX, PY) - UDim2.fromOffset(Size / 2, Size / 2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size, Size) }):Play()
		spawn(function() wait(2)
			Circle:Destroy()
		end)
	end

	local ThisTheme
	local AstroLib = {}
	local Styles = {
		[1] = "Normal",
	}

	local NavBar = {
		Normal = function()
			local NewNavBar = Objects.new("Round")
			NewNavBar.Name = "NavBar"
			NewNavBar.Size = UDim2.fromOffset(150, 360)
			NewNavBar.Position = UDim2.fromOffset(5, 35)
			NewNavBar.ImageColor3 = ThisTheme.NavBar
			NewNavBar.ZIndex = 100

			local NavBarShadow = Objects.new("Shadow")
			NavBarShadow.ImageColor3 = ThisTheme.NavBar
			NavBarShadow.Parent = NewNavBar
			NavBarShadow.ZIndex = 100

			local NavBarContent = Objects.new("Scroll")
			NavBarContent.Name = "Content"
			NavBarContent.Parent = NewNavBar

			NavBarContent.ChildAdded:Connect(function(Child)
				pcall(function()
					local Children = #NavBarContent:GetChildren() - 2
					game:GetService("TweenService"):Create(Child, TweenInfo.new(1), { TextTransparency = (Children > 1) and 0.5 or 0 }):Play()
				end)
				pcall(function()
					local Children = #NavBarContent:GetChildren() - 2
					game:GetService("TweenService"):Create(Child, TweenInfo.new(1), { ImageTransparency = (Children > 1) and 0.5 or 0 }):Play()
				end)
				pcall(function()
					local Children = #NavBarContent:GetChildren() - 2
					game:GetService("TweenService"):Create(Child:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(1), { ImageTransparency = (Children > 1) and 0.5 or 0 }):Play()
				end)
				pcall(function()
					Child.TextColor3 = ThisTheme.NavBarAccent
				end)
				pcall(function()
					Child:FindFirstChildWhichIsA("ImageLabel").ImageColor3 = ThisTheme.NavBarAccent
				end)
				pcall(function()
					Child.ImageColor3 = ThisTheme.NavBarAccent
				end)
			end)

			local NavBarList = Objects.new("UIListLayout")
			NavBarList.FillDirection = Enum.FillDirection.Vertical
			NavBarList.HorizontalAlignment = Enum.HorizontalAlignment.Left
			NavBarList.VerticalAlignment = Enum.VerticalAlignment.Top
			NavBarList.SortOrder = Enum.SortOrder.LayoutOrder
			NavBarList.Parent = NavBarContent

			local NavBarPadding = Objects.new("UIPadding")
			NavBarPadding.PaddingLeft = UDim.new(0, 5)
			NavBarPadding.Parent = NavBarContent

			return NewNavBar, NavBarContent
		end
	}

	local MainGUI
	function TryAddMenu(Object, Menu, ReturnTable)
		local Menu = Menu
		local ReturnTable = ReturnTable
		ReturnTable.Object = Object
		local Total = 0

		table.foreach(Menu, function(_, Value)
			Total = Total + ((typeof(Value) == "function") and 1 or 0)
		end)

		if Total > 0 then
			local MenuToggle = false
			local MenuButton = Objects.new("Menu")
			MenuButton.ImageTransparency = 1
			MenuButton.Parent = Object

			game:GetService("TweenService"):Create(MenuButton, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()
			local Size = Total * 30 + ((Total + 1) * 2)

			local MenuBuild = Objects.new("Round")
			MenuBuild.Name = "Menu"
			MenuBuild.ImageColor3 = ThisTheme.ButtonAccent
			MenuBuild.Size = UDim2.fromOffset(120, 0)
			MenuBuild.Position = UDim2.fromOffset(MenuButton.AbsolutePosition.X, MenuButton.AbsolutePosition.Y) - UDim2.fromOffset(125, 5)
			MenuBuild.ZIndex = 100
			MenuBuild.ClipsDescendants = true
			MenuBuild.Parent = MainGUI

			MenuButton:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				MenuBuild.Position = UDim2.fromOffset(MenuButton.AbsolutePosition.X, MenuButton.AbsolutePosition.Y) - UDim2.fromOffset(125, 5)
			end)

			local MenuContent = Objects.new("Frame")
			MenuContent.Name = "Content"
			MenuContent.Parent = MenuBuild

			local MenuList = Objects.new("UIListLayout")
			MenuList.Padding = UDim.new(0, 2)
			MenuList.Parent = MenuContent

			local MenuPadding = Objects.new("UIPadding")
			MenuPadding.PaddingTop = UDim.new(0, 2)
			MenuPadding.PaddingRight = UDim.new(0, 2)
			MenuPadding.PaddingLeft = UDim.new(0, 2)
			MenuPadding.PaddingBottom = UDim.new(0, 2)
			MenuPadding.Parent = MenuContent

			MenuButton.MouseButton1Down:Connect(function()
				MenuToggle = not MenuToggle
				game:GetService("TweenService"):Create(MenuBuild, TweenInfo.new(0.15), { Size = MenuToggle and UDim2.fromOffset(120, Size) or UDim2.fromOffset(120, 0) }):Play()
			end)

			table.foreach(Menu, function(Option, Value)
				if typeof(Value) == "function" then
					local MenuOption = Objects.new("SmoothButton")
					MenuOption.Name = "MenuOption"
					MenuOption.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
					MenuOption.ImageColor3 = ThisTheme.Button
					MenuOption.ImageTransparency = 1
					MenuOption.ZIndex = 150
					MenuOption.Parent = MenuContent

					local OptionShadow = Objects.new("Shadow")
					OptionShadow.ImageColor3 = ThisTheme.Button
					OptionShadow.ImageTransparency = 1
					OptionShadow.Parent = MenuOption

					local OptionValue = Objects.new("Label")
					OptionValue.Name = "Value"
					OptionValue.Position = UDim2.fromScale(0, 0)
					OptionValue.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0)
					OptionValue.Text = Option
					OptionValue.TextColor3 = ThisTheme.Button
					OptionValue.Font = Enum.Font.Gotham
					OptionValue.TextSize = 12
					OptionValue.ZIndex = 150
					OptionValue.TextXAlignment = Enum.TextXAlignment.Right
					OptionValue.Parent = MenuOption

					MenuOption.MouseButton1Down:Connect(function()
						Value(ReturnTable)
						MenuToggle = false
						game:GetService("TweenService"):Create(MenuBuild, TweenInfo.new(0.15), { Size = UDim2.fromOffset(120, 0) }):Play()
					end)

					MenuOption.MouseEnter:Connect(function()
						game:GetService("TweenService"):Create(MenuOption, TweenInfo.new(0.15), { ImageTransparency = 0.8 }):Play()
						game:GetService("TweenService"):Create(OptionShadow, TweenInfo.new(0.15), { ImageTransparency = 0.8 }):Play()
					end)

					MenuOption.MouseLeave:Connect(function()
						game:GetService("TweenService"):Create(MenuOption, TweenInfo.new(0.15), { ImageTransparency = 1 }):Play()
						game:GetService("TweenService"):Create(OptionShadow, TweenInfo.new(0.15), { ImageTransparency = 1 }):Play()
					end)
				end
			end)
			return true, MenuButton
		end
		return false
	end

	function CreateNewButton(ButtonConfig, Parent)
		local ButtonText = ButtonConfig.Text or "nil button"
		local ButtonCallback = ButtonConfig.Callback or function() print("nil button") end
		local Menu = ButtonConfig.Menu or {}

		local Button = Objects.new("SmoothButton")
		Button.Name = "Button"
		Button.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
		Button.ImageColor3 = ThisTheme.Button
		Button.ImageTransparency = 0
		Button.Parent = Parent

		local ButtonShadow = Objects.new("Shadow")
		ButtonShadow.ImageColor3 = ThisTheme.Button
		ButtonShadow.ImageTransparency = 0
		ButtonShadow.Parent = Button

		local ButtonLabel = Objects.new("Label")
		ButtonLabel.Text = ButtonText
		ButtonLabel.TextColor3 = ThisTheme.ButtonAccent
		ButtonLabel.Font = Enum.Font.GothamSemibold
		ButtonLabel.TextSize = 14
		ButtonLabel.ClipsDescendants = true
		ButtonLabel.TextTransparency = 0
		ButtonLabel.Parent = Button

		-- game:GetService("TweenService"):Create(Button, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
		-- game:GetService("TweenService"):Create(ButtonShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
		-- game:GetService("TweenService"):Create(ButtonLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

		Button.MouseButton1Down:Connect(function()
			if _G.Generated == nil or _G.Generated == false then CircleAnim(ButtonLabel, ThisTheme.ButtonAccent, ThisTheme.Button) end
			ButtonCallback()
		end)

		local MenuAdded = TryAddMenu(Button, Menu, {})
		return Button, ButtonLabel
	end

	function AstroLib.Load(Title)
		local Title = Title or '[ ASTRO HUB ]: ' .. gameName
		local Theme = Themes
		local Open = gengenv()['Show Gui'] or true

		ThisTheme = Theme
		-- local function GetExploit()
		-- 	local Table = {};
		-- 	Table.Fluxus = fluxus;

		-- 	for ExploitName, ExploitFunction in next, Table do
		-- 		if (ExploitFunction) then
		-- 			return ExploitName;
		-- 		end
		-- 	end

		-- 	return "Undefined";
		-- end

		-- local ProtectFunctions = {};
		-- ProtectFunctions.Synapse = function(GuiObject) syn.protect_gui(GuiObject); GuiObject.Parent = game:GetService("CoreGui"); end;
		-- ProtectFunctions.ProtoSmasher = function(GuiObject) GuiObject.Parent = get_hidden_gui(); end;
		-- ProtectFunctions.Sentinel = function(GuiObject) GuiObject.Parent = game:GetService("CoreGui"); end;
		-- ProtectFunctions.ScriptWare = function(GuiObject) GuiObject.Parent = gethui(); end;
		-- ProtectFunctions.Undefined = function(GuiObject) GuiObject.Parent = game:GetService("CoreGui"); end;

		local NewInstance = Objects.new("ScreenGui")
		NewInstance.Name = 'ASTRO'
		-- ProtectFunctions[GetExploit()](NewInstance);

		MainGUI = NewInstance
		local MainFrame = Objects.new("Round")
		MainFrame.Name = "MainFrame"
		MainFrame.Size = UDim2.fromOffset(0, 400)
		MainFrame.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(650 / 2, 400 / 2)
		MainFrame.ImageColor3 = Theme.MainFrame
		MainFrame.Parent = NewInstance

		game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(1), { Size = UDim2.fromOffset(650, 400) }):Play()
		wait(1)

		local MainShadow = Objects.new("Shadow")
		MainShadow.ImageColor3 = Theme.MainFrame
		MainShadow.Parent = MainFrame

		local TitleBar = Objects.new("SmoothButton")
		TitleBar.Name = "TitleBar"
		TitleBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
		TitleBar.ImageColor3 = Theme.TitleBar
		TitleBar.ImageTransparency = 1
		TitleBar.Parent = MainFrame

		local ExtraBar = Objects.new("Frame")
		ExtraBar.Name = "Hidden"
		ExtraBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 5)
		ExtraBar.Position = UDim2.fromScale(0, 1) - UDim2.fromOffset(0, 5)
		ExtraBar.BackgroundColor3 = Theme.TitleBar
		ExtraBar.Parent = TitleBar

		local TitleShadow = Objects.new("Shadow")
		TitleShadow.ImageColor3 = Theme.TitleBar
		TitleShadow.ImageTransparency = 1
		TitleShadow.Parent = TitleBar

		local TitleText = Objects.new("Button")
		TitleText.Name = "Title"
		TitleText.Text = Title
		TitleText.TextColor3 = Theme.TitleBarAccent
		TitleText.TextTransparency = 1
		TitleText.Font = Enum.Font.GothamBold
		TitleText.Parent = TitleBar

		TitleText.MouseButton1Down:Connect(function()
			local Mx, My = Player:GetMouse().X, Player:GetMouse().Y
			local MouseMove, MouseKill
			MouseMove = Player:GetMouse().Move:Connect(function()
				local nMx, nMy = Player:GetMouse().X, Player:GetMouse().Y
				local Dx, Dy = nMx - Mx, nMy - My
				MainFrame.Position = MainFrame.Position + UDim2.fromOffset(Dx, Dy)
				Mx, My = nMx, nMy
			end)
			MouseKill = game:GetService("UserInputService").InputEnded:Connect(function(UserInput)
				if UserInput.UserInputType == Enum.UserInputType.MouseButton1 then
					MouseMove:Disconnect()
					MouseKill:Disconnect()
				end
			end)
		end)

		local MinimiseButton = Objects.new("SmoothButton")
		MinimiseButton.Size = UDim2.fromOffset(20, 20)
		MinimiseButton.Position = UDim2.fromScale(1, 0) + UDim2.fromOffset(-50, 5)
		MinimiseButton.ImageColor3 = Theme.Minimise
		MinimiseButton.ImageTransparency = 1
		MinimiseButton.Parent = TitleBar

		local MinimiseShadow = Objects.new("Shadow")
		MinimiseShadow.ImageColor3 = Theme.MinimiseAccent
		MinimiseShadow.ImageTransparency = 1
		MinimiseShadow.Parent = MinimiseButton

		local DeleteButton = Objects.new("SmoothButton")
		DeleteButton.Size = UDim2.fromOffset(20, 20)
		DeleteButton.Position = UDim2.fromScale(1, 0) + UDim2.fromOffset(-25, 5)
		DeleteButton.ImageColor3 = Theme.Delete
		DeleteButton.ImageTransparency = 1
		DeleteButton.Parent = TitleBar

		local DeleteShadow = Objects.new("Shadow")
		DeleteShadow.ImageColor3 = Theme.DeleteAccent
		DeleteShadow.ImageTransparency = 1
		DeleteShadow.Parent = DeleteButton

		local TimeDisplay = Objects.new("SmoothButton")
		TimeDisplay.Size = UDim2.fromOffset(-105, 20)
		TimeDisplay.Position = UDim2.fromScale(1, 0) + UDim2.fromOffset(-55, 5)
		TimeDisplay.ImageTransparency = 1
		TimeDisplay.Parent = TitleBar

		local TimeText = Objects.new("Button")
		TimeText.Name = "Time Display"
		TimeText.Text = 'TIME: ' .. os.date("%H") .. ":" .. os.date("%M") .. ":" .. os.date("%S")
		TimeText.TextColor3 = Theme.Time
		TimeText.TextTransparency = 1
		TimeText.Font = Enum.Font.GothamBold
		TimeText.Parent = TimeDisplay

		spawn(function()
			while wait() do
				TimeText.Text = 'TIME: ' .. os.date("%H") .. ":" .. os.date("%M") .. ":" .. os.date("%S")
			end
		end)

		DeleteButton.MouseButton1Click:Connect(function()
			if game:GetService("CoreGui"):FindFirstChild('ASTRO') then game:GetService("CoreGui")['ASTRO']:Destroy() end
		end)

		MinimiseButton.MouseButton1Down:Connect(function()
			Open = not Open
			game:GetService("TweenService"):Create(MainShadow, TweenInfo.new(0.15), { ImageTransparency = 1 }):Play()
			game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(0.15), { Size = Open and UDim2.fromOffset(650, 400) or UDim2.fromOffset(650, 30) }):Play()
			game:GetService("TweenService"):Create(MinimiseButton, TweenInfo.new(0.15), { ImageColor3 = Open and Theme.Minimise or Theme.Maximise }):Play()
			game:GetService("TweenService"):Create(MinimiseShadow, TweenInfo.new(0.15), { ImageColor3 = Open and Theme.MinimiseAccent or Theme.MaximiseAccent }):Play()
			game:GetService("CoreGui")['ASTRO'].MainFrame['Content'].Visible = not game:GetService("CoreGui")['ASTRO'].MainFrame['Content'].Visible
			game:GetService("CoreGui")['ASTRO'].MainFrame['NavBar'].Visible = not game:GetService("CoreGui")['ASTRO'].MainFrame['NavBar'].Visible
			if game:GetService("CoreGui")['ASTRO'].MainFrame:FindFirstChild('BannerOverlay') and game:GetService("CoreGui")['ASTRO'].MainFrame:FindFirstChild('Banner') then
				game:GetService("CoreGui")['ASTRO'].MainFrame['BannerOverlay'].Visible = not game:GetService("CoreGui")['ASTRO'].MainFrame['BannerOverlay'].Visible
				game:GetService("CoreGui")['ASTRO'].MainFrame['Banner'].Visible = not game:GetService("CoreGui")['ASTRO'].MainFrame['Banner'].Visible
			end
			if Open then wait(0.15)
				MainFrame.ClipsDescendants = false
				game:GetService("TweenService"):Create(MainShadow, TweenInfo.new(0.15), { ImageTransparency = 0 }):Play()
			else
				MainFrame.ClipsDescendants = true
			end
		end)

		local Content = Objects.new("Round")
		Content.Name = "Content"
		Content.ImageColor3 = Theme.Content
		Content.Size = UDim2.fromOffset(485, 360)
		Content.Position = UDim2.fromOffset(160, 35)
		Content.ImageTransparency = 1
		Content.Parent = MainFrame

		local NavigationBar, NavigationBarContent, NavBarMenu, NavBarOverlay = NavBar[Styles[1]]()
		NavigationBar.Parent = MainFrame

		game:GetService("TweenService"):Create(TitleBar, TweenInfo.new(1), { ImageTransparency = 0 }):Play()
		game:GetService("TweenService"):Create(ExtraBar, TweenInfo.new(1), { BackgroundTransparency = 0 }):Play()
		game:GetService("TweenService"):Create(TitleShadow, TweenInfo.new(1), { ImageTransparency = 0 }):Play()
		game:GetService("TweenService"):Create(TitleText, TweenInfo.new(1), { TextTransparency = 0 }):Play()
		game:GetService("TweenService"):Create(TimeText, TweenInfo.new(1), { TextTransparency = 0 }):Play()
		game:GetService("TweenService"):Create(MinimiseButton, TweenInfo.new(1), { ImageTransparency = 0 }):Play()
		game:GetService("TweenService"):Create(MinimiseShadow, TweenInfo.new(1), { ImageTransparency = 0 }):Play()
		game:GetService("TweenService"):Create(DeleteButton, TweenInfo.new(1), { ImageTransparency = 0 }):Play()
		game:GetService("TweenService"):Create(DeleteShadow, TweenInfo.new(1), { ImageTransparency = 0 }):Play()
		game:GetService("TweenService"):Create(Content, TweenInfo.new(1), { ImageTransparency = 0.8 }):Play()

		wait(1)
		if NavBarMenu then
			game:GetService("TweenService"):Create(TitleText, TweenInfo.new(0.5), { Size = TitleText.Size - UDim2.fromOffset(25, 0), Position = TitleText.Position + UDim2.fromOffset(25, 0) }):Play()
			game:GetService("TweenService"):Create(Content, TweenInfo.new(0.5), { Size = Content.Size + UDim2.fromOffset(0, 35), Position = Content.Position - UDim2.fromOffset(0, 35) }):Play()

			NavBarMenu.ImageTransparency = 1
			NavBarMenu.Parent = TitleBar
			game:GetService("TweenService"):Create(NavBarMenu, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()

			NavBarOverlay.Parent = MainFrame
			local MenuToggle = false
			NavBarMenu.MouseButton1Down:Connect(function()
				MenuToggle = not MenuToggle
				game:GetService("TweenService"):Create(NavigationBar, TweenInfo.new(0.15), { Size = (MenuToggle and UDim2.fromScale(0.5, 1) or UDim2.fromScale(0, 1)) - UDim2.fromOffset(0, 30) }):Play()
				game:GetService("TweenService"):Create(NavBarOverlay, TweenInfo.new(0.15), { BackgroundTransparency = MenuToggle and 0.5 or 1 }):Play()
				if MenuToggle then wait(0.15)
					NavigationBar.ClipsDescendants = false
				else
					NavigationBar.ClipsDescendants = true
				end
			end)
		end

		local uitoggled = false
		game:GetService("UserInputService").InputBegan:Connect(function(io)
			if io.KeyCode == Enum.KeyCode.RightControl then
				if uitoggled == false then
					uitoggled = true
					game:GetService("CoreGui")['ASTRO'].Enabled = false
				else
					uitoggled = false
					game:GetService("CoreGui")['ASTRO'].Enabled = true
				end
			end
		end)

		local TabCount = 0
		local TabLibrary = {}
		local ButtonTrack = {}
		local PageTrack = {}

		local NotifyFrame = Objects.new('Frame')
		NotifyFrame.Name = 'NotifyFrame'
		NotifyFrame.Parent = NewInstance
		NotifyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		NotifyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		NotifyFrame.BorderSizePixel = 0
		NotifyFrame.Position = UDim2.new(1, -210, 1, -500)
		NotifyFrame.Size = UDim2.new(0, 400, 0, 500)
		NotifyFrame.ClipsDescendants = true
		NotifyFrame.BackgroundTransparency = 1

		local NotifyListLayout = Objects.new('UIListLayout')
		NotifyListLayout.Parent = NotifyFrame
		NotifyListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		NotifyListLayout.Padding = UDim.new(0, 5)

		function TabLibrary.Notify(NotifyConfig)
			local NotifyTitle = NotifyConfig.Title or '[ ASTRO HUB ]'
			local NotifyText = NotifyConfig.Text or 'Nevermind'
			local NotifyDelays = NotifyConfig.Delay or 3

			local Notify_TitleFrame = Objects.new('Frame')
			Notify_TitleFrame.Name = 'TitleFrame'
			Notify_TitleFrame.Parent = NotifyFrame
			Notify_TitleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			Notify_TitleFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			Notify_TitleFrame.BorderSizePixel = 0
			Notify_TitleFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			Notify_TitleFrame.Size = UDim2.new(0, 0, 0, 0)
			Notify_TitleFrame.ClipsDescendants = true
			Notify_TitleFrame.BackgroundTransparency = 0

			local TitleFrame_Conner = Objects.new("UICorner")
			TitleFrame_Conner.CornerRadius = UDim.new(0, 4)
			TitleFrame_Conner.Name = ""
			TitleFrame_Conner.Parent = Notify_TitleFrame
			Notify_TitleFrame:TweenSizeAndPosition(UDim2.new(0, 400 - 10, 0, 70), UDim2.new(0.5, 0, 0.5, 0), "Out", "Quad", 0.3, true)

			local Nofity_Image = Objects.new("ImageLabel")
			Nofity_Image.Parent = Notify_TitleFrame
			Nofity_Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Nofity_Image.BackgroundTransparency = 1
			Nofity_Image.AnchorPoint = Vector2.new(0.5, 0.5)
			Nofity_Image.Position = UDim2.new(0.9, 0, 0.5, 0)
			Nofity_Image.Size = UDim2.new(0, 50, 0, 50)
			Nofity_Image.Image = "https://www.roblox.com/asset-thumbnail/image?assetId=7578496318&width=0&height=0&format=png"

			local Notify_Title = Objects.new("Label")
			Notify_Title.Parent = Notify_TitleFrame
			Notify_Title.Name = "Notify_Title"
			Notify_Title.BackgroundColor3 = Color3.fromRGB(25, 233, 80)
			Notify_Title.Size = UDim2.new(0, 160, 0, 25)
			Notify_Title.Font = Enum.Font.GothamBold
			Notify_Title.Text = NotifyTitle
			Notify_Title.TextColor3 = Color3.fromRGB(25, 233, 80)
			Notify_Title.TextSize = 13.000
			Notify_Title.AnchorPoint = Vector2.new(0.5, 0.5)
			Notify_Title.Position = UDim2.new(0.23, 0, 0.3, 0)
			Notify_Title.TextYAlignment = Enum.TextYAlignment.Top
			Notify_Title.TextXAlignment = Enum.TextXAlignment.Left
			Notify_Title.BackgroundTransparency = 1

			local Notify_LabelFrame = Objects.new("Frame")
			Notify_LabelFrame.Name = "Notify_LabelFrame"
			Notify_LabelFrame.Parent = Notify_TitleFrame
			Notify_LabelFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			Notify_LabelFrame.BackgroundColor3 = Color3.fromRGB(25, 233, 80)
			Notify_LabelFrame.BorderSizePixel = 0
			Notify_LabelFrame.Position = UDim2.new(0.36, 0, 0.67, 0)
			Notify_LabelFrame.Size = UDim2.new(0, 260, 0, 25)
			Notify_LabelFrame.ClipsDescendants = true
			Notify_LabelFrame.BackgroundTransparency = 1

			local Notify_Text = Objects.new("Label")
			Notify_Text.Parent = Notify_LabelFrame
			Notify_Text.Name = "Notify_Text"
			Notify_Text.BackgroundColor3 = Color3.fromRGB(25, 233, 80)
			Notify_Text.Size = UDim2.new(0, 260, 0, 25)
			Notify_Text.Font = Enum.Font.GothamBold
			Notify_Text.Text = NotifyText
			Notify_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
			Notify_Text.TextSize = 13.000
			Notify_Text.AnchorPoint = Vector2.new(0.5, 0.5)
			Notify_Text.Position = UDim2.new(0.5, 0, 0.5, 0)
			Notify_Text.TextYAlignment = Enum.TextYAlignment.Top
			Notify_Text.TextXAlignment = Enum.TextXAlignment.Left
			Notify_Text.BackgroundTransparency = 1

			repeat wait() until Notify_TitleFrame.Size == UDim2.new(0, 400 - 10, 0, 70)
			local Time = Objects.new("Frame")
			Time.Name = "Time"
			Time.Parent = Notify_TitleFrame
			Time.AnchorPoint = Vector2.new(0.5, 0.5)
			Time.BackgroundColor3 = Color3.fromRGB(25, 233, 80)
			Time.BorderSizePixel = 0
			Time.Position = UDim2.new(0, 0, 0., 0)
			Time.Size = UDim2.new(0, 0, 0, 0)
			Time.ClipsDescendants = false
			Time.BackgroundTransparency = 0

			local Time_Conner = Objects.new("UICorner")
			Time_Conner.CornerRadius = UDim.new(0, 4)
			Time_Conner.Name = ""
			Time_Conner.Parent = Time

			Time:TweenSizeAndPosition(UDim2.new(0, 400 - 10, 0, 3), UDim2.new(0., 0, 0., 0), "Out", "Quad", 0.3, true)
			repeat wait() until Time.Size == UDim2.new(0, 400 - 10, 0, 3)
			game:GetService("TweenService"):Create(Time, TweenInfo.new(tonumber(NotifyDelays), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), { Size = UDim2.new(0, 0, 0, 3) }):Play()
			delay(tonumber(NotifyDelays), function()
				game:GetService("TweenService"):Create(Notify_TitleFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { Size = UDim2.new(0, 0, 0, 0) }):Play()
				wait(0.3) Notify_TitleFrame:Destroy()
			end)
		end

		function TabLibrary.Banner(BannerConfig)
			local BannerText = BannerConfig.Text
			local BannerOptions = BannerConfig.Options or {}

			local ExistingBanner, ExistingBannerOverlay = MainFrame:FindFirstChild("BannerOverlay"), MainFrame:FindFirstChild("Banner")
			if ExistingBanner then ExistingBanner:Destroy() end
			if ExistingBannerOverlay then ExistingBannerOverlay:Destroy() end
			local BannerOverlay = Objects.new("SmoothButton")
			BannerOverlay.Name = "BannerOverlay"
			BannerOverlay.BackgroundColor3 = Theme.BannerAccent
			BannerOverlay.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 30)
			BannerOverlay.Position = UDim2.fromOffset(0, 30)
			BannerOverlay.ZIndex = 200
			BannerOverlay.ImageTransparency = 1
			BannerOverlay.Parent = MainFrame

			local TextSize = game:GetService("TextService"):GetTextSize(BannerText, 12, Enum.Font.Gotham, Vector2.new(0, 0)).X
			local Lines = math.ceil((TextSize) / (MainFrame.AbsoluteSize.X - 10))
			local BannerSize = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, (Lines * 20) + 40)
			local BannerPosition = UDim2.fromScale(0, 1) + UDim2.fromOffset(5, (-Lines * 20) - 45)

			local Banner = Objects.new("Round")
			Banner.Name = "Banner"
			Banner.ImageTransparency = 1
			Banner.ImageColor3 = Theme.Banner
			Banner.Size = BannerSize
			Banner.Position = BannerPosition
			Banner.ZIndex = 200
			Banner.Parent = MainFrame

			local BannerLabel = Objects.new("Label")
			BannerLabel.Name = "Value"
			BannerLabel.Text = BannerText
			BannerLabel.TextColor3 = Theme.BannerAccent
			BannerLabel.TextSize = 12
			BannerLabel.Font = Enum.Font.Gotham
			BannerLabel.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-5, (Lines * 20) + 5)
			BannerLabel.TextWrapped = true
			BannerLabel.Position = UDim2.fromOffset(5, 0)
			BannerLabel.TextTransparency = 1
			BannerLabel.ZIndex = 200
			BannerLabel.Parent = Banner

			game:GetService("TweenService"):Create(BannerOverlay, TweenInfo.new(0.5), { ImageTransparency = 0.5 }):Play()
			game:GetService("TweenService"):Create(Banner, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()
			game:GetService("TweenService"):Create(BannerLabel, TweenInfo.new(0.5), { TextTransparency = 0 }):Play()

			local BannerContainer = Objects.new("Frame")
			BannerContainer.Name = "Options"
			BannerContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 0)
			BannerContainer.Position = UDim2.fromScale(0, 1) - UDim2.fromOffset(-5, 35)
			BannerContainer.ZIndex = 200
			BannerContainer.ClipsDescendants = true
			BannerContainer.Parent = Banner

			local BannerList = Objects.new("UIListLayout")
			BannerList.FillDirection = Enum.FillDirection.Horizontal
			BannerList.HorizontalAlignment = Enum.HorizontalAlignment.Right
			BannerList.SortOrder = Enum.SortOrder.LayoutOrder
			BannerList.Padding = UDim.new(0, 5)
			BannerList.Parent = BannerContainer

			BannerOptions["Nevermind"] = function()
				game:GetService("TweenService"):Create(BannerContainer, TweenInfo.new(0.5), { Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 0) }):Play()
				game:GetService("TweenService"):Create(BannerOverlay, TweenInfo.new(0.5), { ImageTransparency = 1 }):Play()
				game:GetService("TweenService"):Create(Banner, TweenInfo.new(0.5), { ImageTransparency = 1 }):Play()
				game:GetService("TweenService"):Create(BannerLabel, TweenInfo.new(0.5), { TextTransparency = 1 }):Play()
				wait(2) Banner:Destroy() BannerOverlay:Destroy()
			end

			table.foreach(BannerOptions, function(Option, Value)
				if typeof(Value) == "function" then
					local TextSize = game:GetService("TextService"):GetTextSize(Option:upper(), 12, Enum.Font.GothamBold, Vector2.new(0, 0)).X

					local OptionItem = Objects.new("SmoothButton")
					OptionItem.ImageColor3 = Theme.BannerAccent
					OptionItem.ImageTransparency = 0.9
					OptionItem.Size = UDim2.fromOffset(TextSize + 10, 30)
					OptionItem.ZIndex = 200
					OptionItem.ClipsDescendants = true
					OptionItem.Parent = BannerContainer

					local OptionLabel = Objects.new("Label")
					OptionLabel.Text = Option:upper()
					OptionLabel.TextSize = 12
					OptionLabel.TextColor3 = Theme.BannerAccent
					OptionLabel.Font = Enum.Font.GothamBold
					OptionLabel.Size = UDim2.fromScale(1, 1)
					OptionLabel.Position = UDim2.fromScale(0, 0)
					OptionLabel.TextXAlignment = Enum.TextXAlignment.Center
					OptionLabel.ZIndex = 200
					OptionLabel.Parent = OptionItem

					OptionItem.MouseButton1Down:Connect(function() Value()
						if _G.Generated == nil or _G.Generated == false then CircleAnim(OptionItem, Theme.Banner) end
					end)
				end
			end)
			game:GetService("TweenService"):Create(BannerContainer, TweenInfo.new(0.5), { Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 30) }):Play()
		end

		function TabLibrary.New(TabConfig)
			local Title = TabConfig.Title
			local Button
			local Settings = {
				TextSize = 12,
				Font = Enum.Font.GothamBold,
				Vector = Vector2.new(0, 0)
			}

			local TextSize = game:GetService("TextService"):GetTextSize(Title:upper(), Settings.TextSize, Settings.Font, Settings.Vector).X
			Button = Objects.new("Button")
			Button.Name = Title:upper()
			Button.TextXAlignment = Enum.TextXAlignment.Left
			Button.TextSize = Settings.TextSize
			Button.Font = Settings.Font
			Button.Text = Title:upper()
			-- Button.Size = UDim2.fromOffset(TextSize + 10, 40)
			Button.Size = UDim2.fromOffset(140, 40)
			Button.ZIndex = 200
			Button.TextTransparency = 1
			Button.Parent = NavigationBarContent

			local PageContentFrame = Objects.new("Scroll")
			PageContentFrame.Name = Title:upper() or ImageID
			PageContentFrame.Visible = (TabCount == 0)
			PageContentFrame.ZIndex = 200
			PageContentFrame.Parent = Content

			table.insert(ButtonTrack, Button)
			table.insert(PageTrack, PageContentFrame)
			Button.MouseButton1Down:Connect(function()
				for _, Track in next, ButtonTrack do
					if not (Track == Button) then
						game:GetService("TweenService"):Create(Track, TweenInfo.new(0.15), { TextTransparency = 0.5 }):Play()
						pcall(function()
							game:GetService("TweenService"):Create(Track:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(0.15), { ImageTransparency = 0.5 }):Play()
						end)
					else
						game:GetService("TweenService"):Create(Track, TweenInfo.new(0.15), { TextTransparency = 0 }):Play()
						pcall(function()
							game:GetService("TweenService"):Create(Track:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(0.15), { ImageTransparency = 0 }):Play()
						end)
					end
				end
				for _, Track in next, PageTrack do
					Track.Visible = (Track == PageContentFrame)
				end
			end)

			local PagePadding = Objects.new("UIPadding")
			PagePadding.PaddingLeft = UDim.new(0, 5)
			PagePadding.PaddingRight = UDim.new(0, 5)
			PagePadding.PaddingTop = UDim.new(0, 5)
			PagePadding.PaddingBottom = UDim.new(0, 5)
			PagePadding.Parent = PageContentFrame

			local PageList = Objects.new("UIListLayout")
			PageList.SortOrder = Enum.SortOrder.LayoutOrder
			PageList.Padding = UDim.new(0, 5)
			PageList.Parent = PageContentFrame

			PageList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				PageContentFrame.CanvasSize = UDim2.fromOffset(0, PageList.AbsoluteContentSize.Y + 10)
			end)

			TabCount = TabCount + 1
			local OptionLibrary = {}
			function OptionLibrary.Button(ButtonConfig)
				local NewButton, ButtonLabel = CreateNewButton(ButtonConfig, PageContentFrame)
			end

			function OptionLibrary.Dropdown(DropdownConfig)
				local DropdownLibrary = {}
				local DropdownText = DropdownConfig.Text or "nil dropdown"
				local DropdownCallback = DropdownConfig.Callback or function() print("nil dropdown") end
				local DropdownOptions = DropdownConfig.Options or {}
				local Menu = DropdownConfig.Menu or {}

				local Dropdown = Objects.new("Frame")
				Dropdown.Name = "Dropdown"
				Dropdown.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
				Dropdown.Parent = PageContentFrame

				local DropdownBar = Objects.new("Round")
				DropdownBar.Name = "TitleBar"
				DropdownBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
				DropdownBar.ImageColor3 = Theme.Dropdown
				DropdownBar.ImageTransparency = 1
				DropdownBar.Parent = Dropdown

				local DropdownTitle = Objects.new("Button")
				DropdownTitle.Name = "Title"
				DropdownTitle.Font = Enum.Font.GothamSemibold
				DropdownTitle.Text = DropdownText
				DropdownTitle.TextColor3 = Theme.DropdownAccent
				DropdownTitle.TextTransparency = 1
				DropdownTitle.TextSize = 14
				DropdownTitle.Parent = DropdownBar

				local DropdownToggle = Objects.new("Round")
				DropdownToggle.Name = "Container"
				DropdownToggle.Size = UDim2.fromOffset(24, 24)
				DropdownToggle.Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(27, 12)
				DropdownToggle.ImageColor3 = Theme.DropdownAccent
				DropdownToggle.ImageTransparency = 1 -- 0.8
				DropdownToggle.Parent = DropdownBar

				local DropdownButton = Objects.new("Round")
				DropdownButton.Name = "Drop"
				DropdownButton.Image = "http://www.roblox.com/asset/?id=5574299686"
				DropdownButton.ScaleType = Enum.ScaleType.Stretch
				DropdownButton.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(4, 4)
				DropdownButton.Position = UDim2.fromOffset(2, 2)
				DropdownButton.ImageColor3 = Theme.DropdownAccent
				DropdownButton.ImageTransparency = 1
				DropdownButton.Parent = DropdownToggle

				game:GetService("TweenService"):Create(DropdownBar, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()
				game:GetService("TweenService"):Create(DropdownTitle, TweenInfo.new(0.5), { TextTransparency = 0 }):Play()
				game:GetService("TweenService"):Create(DropdownToggle, TweenInfo.new(0.5), { ImageTransparency = 0.8 }):Play()
				game:GetService("TweenService"):Create(DropdownButton, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()

				local DropdownContent = Objects.new("Frame")
				DropdownContent.Name = "Content"
				DropdownContent.Size = UDim2.fromScale(1, 0)
				DropdownContent.Position = UDim2.fromOffset(0, 35)
				DropdownContent.ClipsDescendants = true
				DropdownContent.Parent = Dropdown

				local NumberOfOptions = #DropdownOptions
				local DropToggle = false
				local DropdownSize = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (NumberOfOptions * 20) + ((NumberOfOptions - 1) * 5))
				local DropdownList = Objects.new("UIListLayout")
				DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
				DropdownList.Padding = UDim.new(0, 5)
				DropdownList.Parent = DropdownContent

				DropdownList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					if DropToggle then
						DropdownContent.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(DropdownList.AbsoluteContentSize.Y)
						DropdownSize = UDim2.fromScale(1, 0) + UDim2.fromOffset(DropdownList.AbsoluteContentSize.Y)
					end
				end)

				table.foreach(DropdownOptions, function(_, Value)
					local NewButton = CreateNewButton({
						Text = Value,
						Callback = function() end
					}, DropdownContent)

					NewButton.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
					NewButton.MouseButton1Down:Connect(function()
						DropdownCallback(Value)
						DropdownTitle.Text = DropdownText .. ": " .. Value
					end)
				end)

				DropdownTitle.MouseButton1Down:Connect(function()
					DropToggle = not DropToggle
					game:GetService("TweenService"):Create(DropdownButton, TweenInfo.new(0.15), { Rotation = DropToggle and 135 or 0 }):Play()
					game:GetService("TweenService"):Create(DropdownContent, TweenInfo.new(0.15), { Size = DropToggle and DropdownSize or UDim2.fromScale(1, 0) }):Play()
					game:GetService("TweenService"):Create(Dropdown, TweenInfo.new(0.15), { Size = DropToggle and (DropdownSize + UDim2.fromOffset(0, 35)) or (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)) }):Play()
				end)

				local MenuAdded, MenuButton = TryAddMenu(DropdownBar, Menu, {})

				if MenuAdded then
					DropdownToggle.Position = DropdownToggle.Position - UDim2.fromOffset(25, 0)
					MenuButton.ImageColor3 = Theme.DropdownAccent
				end

				function DropdownLibrary:SetOptions(NewMenu)
					DropdownOptions = NewMenu or {}
					NumberOfOptions = #DropdownOptions
					DropdownSize = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (NumberOfOptions * 20) + ((NumberOfOptions - 1) * 5))

					if DropdownContent then DropdownContent:Destroy() end
					game:GetService("TweenService"):Create(Dropdown, TweenInfo.new(0.15), { Size = DropToggle and (DropdownSize + UDim2.fromOffset(0, 35)) or (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)) }):Play()

					DropdownContent = Objects.new("Frame")
					DropdownContent.Name = "Content"
					DropdownContent.Size = DropToggle and DropdownSize or UDim2.fromScale(1, 0)
					DropdownContent.Position = UDim2.fromOffset(0, 35)
					DropdownContent.ClipsDescendants = true
					DropdownContent.Parent = Dropdown

					local DropdownList = Objects.new("UIListLayout")
					DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
					DropdownList.Padding = UDim.new(0, 5)
					DropdownList.Parent = DropdownContent

					table.foreach(DropdownOptions, function(_, Value)
						local NewButton = CreateNewButton({
							Text = Value,
							Callback = function() end
						}, DropdownContent)
						NewButton.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
						NewButton.MouseButton1Down:Connect(function()
							DropdownCallback(Value)
							DropdownTitle.Text = DropdownText .. ": " .. Value
						end)
					end)
				end
				return DropdownLibrary
			end

			function OptionLibrary.ChipSet(ChipSetConfig)
				local ChipSetText = ChipSetConfig.Text or "nil chipset"
				local ChipSetCallback = ChipSetConfig.Callback or function() print("nil chipset") end
				local ChipSetOptions = ChipSetConfig.Options or {}
				local TotalOptions = 0

				table.foreach(ChipSetOptions, function()
					TotalOptions = TotalOptions + 1
				end)

				if TotalOptions > 0 then
					local Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (TotalOptions * 30) + ((TotalOptions + 1) * 5))

					local ChipSet = Objects.new("Round")
					ChipSet.Name = "ChipSet"
					ChipSet.Size = Size
					ChipSet.ImageColor3 = Theme.ChipSet
					ChipSet.ImageTransparency = 1
					ChipSet.Parent = PageContentFrame

					local ChipList = Objects.new("UIListLayout")
					ChipList.SortOrder = Enum.SortOrder.LayoutOrder
					ChipList.Padding = UDim.new(0, 5)
					ChipList.Parent = ChipSet

					local ChipPadding = Objects.new("UIPadding")
					ChipPadding.PaddingBottom = UDim.new(0, 5)
					ChipPadding.PaddingTop = UDim.new(0, 5)
					ChipPadding.PaddingRight = UDim.new(0, 5)
					ChipPadding.PaddingLeft = UDim.new(0, 5)
					ChipPadding.Parent = ChipSet

					local BuildTable = {}
					table.foreach(ChipSetOptions, function(Key, Value)
						if typeof(Value) == "table" then
							BuildTable[Key] = Value.Enabled
						else
							BuildTable[Key] = Value
						end
					end)
					ChipSetCallback(BuildTable)
					game:GetService("TweenService"):Create(ChipSet, TweenInfo.new(0.5), { ImageTransparency = 0.9 }):Play()

					table.foreach(ChipSetOptions, function(Key, Value)
						local ChipItem = Objects.new("SmoothButton")
						ChipItem.Name = "ChipItem"
						ChipItem.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
						ChipItem.ImageColor3 = BuildTable[Key] and Theme.ChipSet or Theme.ChipSetAccent
						ChipItem.ImageTransparency = 1
						ChipItem.Parent = ChipSet

						local ChipShadow = Objects.new("Shadow")
						ChipShadow.ImageColor3 = BuildTable[Key] and Theme.ChipSet or Theme.ChipSetAccent
						ChipShadow.ImageTransparency = 1
						ChipShadow.Parent = ChipItem

						local Tick = Objects.new("Round")
						Tick.ScaleType = Enum.ScaleType.Stretch
						Tick.Image = "http://www.roblox.com/asset/?id=5554953789"
						Tick.ImageColor3 = Theme.ChipSetAccent
						Tick.ImageTransparency = 1
						Tick.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(10, 10)
						Tick.SizeConstraint = Enum.SizeConstraint.RelativeYY
						Tick.Position = UDim2.fromOffset(5, 5)
						Tick.Parent = ChipItem

						local ChipLabel = Objects.new("Label")
						ChipLabel.Size = BuildTable[Key] and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30)) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5))
						ChipLabel.Position = BuildTable[Key] and UDim2.fromOffset(30) or UDim2.fromOffset(5)
						ChipLabel.Text = Key
						ChipLabel.Font = Enum.Font.Gotham
						ChipLabel.TextSize = 12
						ChipLabel.TextColor3 = BuildTable[Key] and Theme.ChipSetAccent or Theme.ChipSet
						ChipLabel.TextTransparency = 1
						ChipLabel.Parent = ChipItem

						game:GetService("TweenService"):Create(ChipItem, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()
						game:GetService("TweenService"):Create(ChipShadow, TweenInfo.new(0.5), { ImageTransparency = 0.2 }):Play()
						game:GetService("TweenService"):Create(Tick, TweenInfo.new(0.5), { ImageTransparency = BuildTable[Key] and 0 or 1 }):Play()
						game:GetService("TweenService"):Create(ChipLabel, TweenInfo.new(0.5), { TextTransparency = 0 }):Play()

						local ChipMenu
						if typeof(Value) == "table" then
							local Menu = Value.Menu or {}
							local MenuAdded, MenuButton = TryAddMenu(ChipItem, Menu, {})
							MenuButton.ImageColor3 = BuildTable[Key] and Theme.ChipSetAccent or Theme.ChipSet
							ChipMenu = MenuButton
						end

						ChipItem.MouseButton1Down:Connect(function()
							BuildTable[Key] = not BuildTable[Key]
							local Enabled = BuildTable[Key]
							game:GetService("TweenService"):Create(ChipItem, TweenInfo.new(0.15), { ImageColor3 = Enabled and Theme.ChipSet or Theme.ChipSetAccent }):Play()
							game:GetService("TweenService"):Create(ChipShadow, TweenInfo.new(0.15), { ImageColor3 = Enabled and Theme.ChipSet or Theme.ChipSetAccent }):Play()
							game:GetService("TweenService"):Create(Tick, TweenInfo.new(0.15), { ImageTransparency = Enabled and 0 or 1 }):Play()
							game:GetService("TweenService"):Create(ChipLabel, TweenInfo.new(0.15), { TextColor3 = Enabled and Theme.ChipSetAccent or Theme.ChipSet, Position = Enabled and UDim2.fromOffset(30) or UDim2.fromOffset(5), Size = Enabled and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30)) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5)) }):Play()
							if ChipMenu then
								game:GetService("TweenService"):Create(ChipMenu, TweenInfo.new(0.15), { ImageColor3 = Enabled and Theme.ChipSetAccent or Theme.ChipSet }):Play()
							end
							ChipSetCallback(BuildTable)
						end)
					end)
				end
			end

			function OptionLibrary.DataTable(DataTableConfig)
				local DataTableText = DataTableConfig.Text or "nil chipset"
				local DataTableCallback = DataTableConfig.Callback or function() print("nil chipset") end
				local DataTableOptions = DataTableConfig.Options or {}
				local TotalOptions = 0

				table.foreach(DataTableOptions, function()
					TotalOptions = TotalOptions + 1
				end)

				if TotalOptions > 0 then
					local Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (TotalOptions * 30) + ((TotalOptions + 1) * 5))

					local DataTable = Objects.new("Round")
					DataTable.Name = "DataTable"
					DataTable.Size = Size
					DataTable.ImageColor3 = Theme.DataTable
					DataTable.ImageTransparency = 1
					DataTable.Parent = PageContentFrame

					local DataShadow = Objects.new("Shadow")
					DataShadow.ImageColor3 = Theme.DataTable
					DataShadow.ImageTransparency = 1
					DataShadow.Parent = DataTable

					local DataContainer = Objects.new("Frame")
					DataContainer.Name = "Container"
					DataContainer.Parent = DataTable

					local DataList = Objects.new("UIListLayout")
					DataList.SortOrder = Enum.SortOrder.LayoutOrder
					DataList.Padding = UDim.new(0, 5)
					DataList.Parent = DataContainer

					local DataPadding = Objects.new("UIPadding")
					DataPadding.PaddingBottom = UDim.new(0, 5)
					DataPadding.PaddingTop = UDim.new(0, 5)
					DataPadding.PaddingRight = UDim.new(0, 5)
					DataPadding.PaddingLeft = UDim.new(0, 5)
					DataPadding.Parent = DataContainer

					local BuildTable = {}

					table.foreach(DataTableOptions, function(Key, Value)
						if typeof(Value) == "table" then
							BuildTable[Key] = Value.Enabled
						else
							BuildTable[Key] = Value
						end
					end)

					DataTableCallback(BuildTable)

					game:GetService("TweenService"):Create(DataTable, TweenInfo.new(0.5), { ImageTransparency = 0.9 }):Play()
					game:GetService("TweenService"):Create(DataShadow, TweenInfo.new(0.5), { ImageTransparency = 0.8 }):Play()

					table.foreach(DataTableOptions, function(Key, Value)
						local DataItem = Objects.new("SmoothButton")
						DataItem.Name = "DataItem"
						DataItem.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
						DataItem.ImageColor3 = BuildTable[Key] and Theme.DataTable or Theme.DataTableAccent
						DataItem.ImageTransparency = 1
						DataItem.Parent = DataContainer

						local DataTracker = Objects.new("Round")
						DataTracker.Name = "Tracker"
						DataTracker.Size = UDim2.fromOffset(24, 24)
						DataTracker.Position = UDim2.fromScale(0, 0.5) + UDim2.fromOffset(3, -12)
						DataTracker.ImageColor3 = Theme.DataTable
						DataTracker.ImageTransparency = 1
						DataTracker.Parent = DataItem

						local Tick = Objects.new("Round")
						Tick.Name = "Tick"
						Tick.ScaleType = Enum.ScaleType.Stretch
						Tick.Image = "http://www.roblox.com/asset/?id=5554953789"
						Tick.ImageColor3 = Theme.DataTableAccent
						Tick.ImageTransparency = 1
						Tick.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(4, 4)
						Tick.SizeConstraint = Enum.SizeConstraint.RelativeYY
						Tick.Position = UDim2.fromOffset(2, 2)
						Tick.Parent = DataTracker

						local DataLabel = Objects.new("Label")
						DataLabel.Name = "Value"
						DataLabel.Size = (UDim2.fromScale(1, 1) - UDim2.fromOffset(30))
						DataLabel.Position = UDim2.fromOffset(30) or UDim2.fromOffset(5)
						DataLabel.Text = Key
						DataLabel.Font = Enum.Font.Gotham
						DataLabel.TextSize = 14
						DataLabel.TextColor3 = Theme.DataTable
						DataLabel.TextTransparency = 1
						DataLabel.Parent = DataItem

						game:GetService("TweenService"):Create(DataItem, TweenInfo.new(0.5), { ImageTransparency = BuildTable[Key] and 0.8 or 0 }):Play()
						game:GetService("TweenService"):Create(DataTracker, TweenInfo.new(0.5), { ImageTransparency = BuildTable[Key] and 0 or 0.8 }):Play()
						game:GetService("TweenService"):Create(Tick, TweenInfo.new(0.5), { ImageTransparency = BuildTable[Key] and 0 or 0.7 }):Play()
						game:GetService("TweenService"):Create(DataLabel, TweenInfo.new(0.5), { TextTransparency = 0 }):Play()

						local DataMenu
						if typeof(Value) == "table" then
							local Menu = Value.Menu or {}
							local MenuAdded, MenuButton = TryAddMenu(DataItem, Menu, {})
							MenuButton.ImageColor3 = Theme.DataTable
							DataMenu = MenuButton
						end

						DataItem.MouseButton1Down:Connect(function()
							BuildTable[Key] = not BuildTable[Key]
							local Enabled = BuildTable[Key]
							game:GetService("TweenService"):Create(DataItem, TweenInfo.new(0.15), { ImageTransparency = Enabled and 0.8 or 0, ImageColor3 = Enabled and Theme.DataTable or Theme.DataTableAccent }):Play()
							game:GetService("TweenService"):Create(Tick, TweenInfo.new(0.15), { ImageTransparency = Enabled and 0 or 0.7 }):Play()
							game:GetService("TweenService"):Create(DataTracker, TweenInfo.new(0.15), { ImageTransparency = Enabled and 0 or 0.8 }):Play()
							DataTableCallback(BuildTable)
						end)
					end)
				end
			end

			function OptionLibrary.Toggle(ToggleConfig)
				local ToggleLibrary = {}
				local ToggleText = ToggleConfig.Text or "nil toggle"
				local ToggleCallback = ToggleConfig.Callback or function() print("nil toggle") end
				local ToggleDefault = ToggleConfig.Enabled or false
				local Menu = ToggleConfig.Menu or {}

				local Toggle = Objects.new("SmoothButton")
				Toggle.Name = "Toggle"
				Toggle.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
				Toggle.ImageColor3 = Theme.Toggle
				Toggle.ImageTransparency = 1
				Toggle.Parent = PageContentFrame

				local ToggleTracker = Objects.new("Round")
				ToggleTracker.Name = "Tracker"
				ToggleTracker.Image = "rbxassetid://3570695787"
				ToggleTracker.SliceCenter = Rect.new(100, 100, 100, 100)
				ToggleTracker.SliceScale = 1
				ToggleTracker.Size = UDim2.fromOffset(26, 12)
				ToggleTracker.Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(41, 6)
				ToggleTracker.ImageColor3 = Theme.Toggle
				ToggleTracker.ImageTransparency = 1
				ToggleTracker.Parent = Toggle

				local Dot = Objects.new("Circle")
				Dot.Name = "Dot"
				Dot.Size = UDim2.fromOffset(16, 16)
				Dot.Position = UDim2.fromScale(0, 0.5) - UDim2.fromOffset(8, 8)
				Dot.ImageColor3 = Theme.ToggleAccent
				Dot.ImageTransparency = 1
				Dot.Parent = ToggleTracker

				local DotShadow = Objects.new("Round")
				DotShadow.Name = "Shadow"
				DotShadow.Image = "http://www.roblox.com/asset/?id=5554831957"
				DotShadow.ScaleType = Enum.ScaleType.Stretch
				DotShadow.Size = UDim2.fromOffset(31, 31)
				DotShadow.Position = UDim2.fromOffset(-8, -8)
				DotShadow.ImageColor3 = Theme.Toggle
				DotShadow.ImageTransparency = 1
				DotShadow.Parent = Dot

				local ToggleLabel = Objects.new("Label")
				ToggleLabel.Font = Enum.Font.GothamSemibold
				ToggleLabel.TextSize = 14
				ToggleLabel.Text = ToggleText
				ToggleLabel.TextColor3 = Theme.Toggle
				ToggleLabel.TextTransparency = 1
				ToggleLabel.ClipsDescendants = true
				ToggleLabel.Parent = Toggle

				game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.5), { ImageTransparency = 0.8 }):Play()
				game:GetService("TweenService"):Create(ToggleTracker, TweenInfo.new(0.5), { ImageTransparency = 0.5 }):Play()
				game:GetService("TweenService"):Create(Dot, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()
				game:GetService("TweenService"):Create(DotShadow, TweenInfo.new(0.5), { ImageTransparency = 0.5 }):Play()
				game:GetService("TweenService"):Create(ToggleLabel, TweenInfo.new(0.5), { TextTransparency = 0 }):Play()

				game:GetService("TweenService"):Create(Dot, TweenInfo.new(0.15), { Position = (ToggleDefault and UDim2.fromScale(1, 0.5) or UDim2.fromScale(0, 0.5)) - UDim2.fromOffset(8, 8), ImageColor3 = ToggleDefault and Theme.Toggle or Theme.ToggleAccent }):Play()
				ToggleCallback(ToggleDefault)

				Toggle.MouseButton1Down:Connect(function()
					ToggleDefault = not ToggleDefault
					game:GetService("TweenService"):Create(Dot, TweenInfo.new(0.15), { Position = (ToggleDefault and UDim2.fromScale(1, 0.5) or UDim2.fromScale(0, 0.5)) - UDim2.fromOffset(8, 8), ImageColor3 = ToggleDefault and Theme.Toggle or Theme.ToggleAccent }):Play()
					ToggleCallback(ToggleDefault)
					if _G.Generated == nil or _G.Generated == false then CircleAnim(ToggleLabel, Theme.ToggleAccent, Theme.Toggle) end
				end)

				local MenuAdded, MenuButton = TryAddMenu(Toggle, Menu, {})

				if MenuAdded then
					ToggleTracker.Position = ToggleTracker.Position - UDim2.fromOffset(15, 0)
					MenuButton.ImageColor3 = Theme.Toggle
				end

				function ToggleLibrary:SetState(Value)
					ToggleDefault = Value
					game:GetService("TweenService"):Create(Dot, TweenInfo.new(0.15), { Position = (ToggleDefault and UDim2.fromScale(1, 0.5) or UDim2.fromScale(0, 0.5)) - UDim2.fromOffset(8, 8), ImageColor3 = ToggleDefault and Theme.Toggle or Theme.ToggleAccent }):Play()
					ToggleCallback(ToggleDefault)
				end
				return ToggleLibrary
			end

			function OptionLibrary.TextField(TextFieldConfig)
				local TextFieldText = TextFieldConfig.Text or "nil text field"
				local TextFieldInputType = TextFieldConfig.Type or TextFieldConfig.type or "Default"
				local TextFieldCallback = TextFieldConfig.Callback or function() print("nil text field") end
				local Menu = TextFieldConfig.Menu or {}

				local TextField = Objects.new("Round")
				TextField.Name = "TextField"
				TextField.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
				TextField.ImageColor3 = Theme.TextField
				TextField.ImageTransparency = 1
				TextField.Parent = PageContentFrame

				local TextEffect = Objects.new("Frame")
				TextEffect.Name = "Effect"
				TextEffect.BackgroundTransparency = 1
				TextEffect.BackgroundColor3 = Theme.TextField
				TextEffect.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 2)
				TextEffect.Position = UDim2.fromScale(0, 1) - UDim2.fromOffset(0, 2)
				TextEffect.Parent = TextField

				local TextShadow = Objects.new("Shadow")
				TextShadow.ImageColor3 = Theme.TextField
				TextShadow.ImageTransparency = 1
				TextShadow.Parent = TextField

				local TextInput = Objects.new("Box")
				TextInput.Name = "Value"
				TextInput.PlaceholderText = TextFieldText
				TextInput.PlaceholderColor3 = Theme.TextFieldAccent
				TextInput.TextInputType = Enum.TextInputType[TextFieldInputType]
				TextInput.TextColor3 = Theme.TextFieldAccent
				TextInput.Text = ""
				TextInput.Font = Enum.Font.GothamSemibold
				TextInput.TextSize = 14
				TextInput.TextTransparency = 1
				TextInput.Parent = TextField

				game:GetService("TweenService"):Create(TextField, TweenInfo.new(0.5), { ImageTransparency = 0.8 }):Play()
				game:GetService("TweenService"):Create(TextEffect, TweenInfo.new(0.5), { BackgroundTransparency = 0.2 }):Play()
				game:GetService("TweenService"):Create(TextShadow, TweenInfo.new(0.5), { ImageTransparency = 0.7 }):Play()
				game:GetService("TweenService"):Create(TextInput, TweenInfo.new(0.5), { TextTransparency = 0.5 }):Play()

				TextInput.Focused:Connect(function()
					game:GetService("TweenService"):Create(TextField, TweenInfo.new(0.5), { ImageTransparency = 0.7 }):Play()
					game:GetService("TweenService"):Create(TextInput, TweenInfo.new(0.5), { TextTransparency = 0 }):Play()
				end)

				TextInput.FocusLost:Connect(function()
					game:GetService("TweenService"):Create(TextField, TweenInfo.new(0.5), { ImageTransparency = 0.8 }):Play()
					game:GetService("TweenService"):Create(TextInput, TweenInfo.new(0.5), { TextTransparency = 0.5 }):Play()
					TextFieldCallback(TextInput.Text)
				end)

				local MenuAdded, MenuBar = TryAddMenu(TextField, Menu, {
					SetText = function(Value)
						TextInput.Text = Value
						TextFieldCallback(TextInput.Text)
					end
				})

				if MenuAdded then
					MenuBar.ImageColor3 = Theme.TextFieldAccent
				end
			end

			function OptionLibrary.Label(LabelConfig)
				local LabelOptions = {}
				local LabelText = LabelConfig.Text or "nil label"

				local LabelContainer = Objects.new("Round")
				LabelContainer.Name = "Label"
				LabelContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
				LabelContainer.ImageColor3 = Theme.MainFrame
				LabelContainer.Parent = PageContentFrame

				local LabelContent = Objects.new("Label")
				LabelContent.TextColor3 = Theme.ChipSet
				LabelContent.Text = LabelText:upper()
				LabelContent.TextSize = 12
				LabelContent.Font = Enum.Font.GothamSemibold
				LabelContent.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(-5, 0)
				LabelContent.Position = UDim2.fromOffset(5, 0)
				LabelContent.Parent = LabelContainer

				function LabelOptions.SetText(Text)
					LabelContent.Text = Text
				end
				return LabelOptions
			end

			function OptionLibrary.BigLabel(BigLabelConfig)
				local BigLabelOptions = {}
				local BigLabelText = BigLabelConfig.Text or "nil big label"

				local BigLabelContainer = Objects.new("Round")
				BigLabelContainer.Name = "BigLabel"
				BigLabelContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 60)
				BigLabelContainer.ImageColor3 = Theme.MainFrame
				BigLabelContainer.Parent = PageContentFrame

				local BigLabelContent = Objects.new("Label")
				BigLabelContent.TextColor3 = Theme.ChipSet
				BigLabelContent.Text = BigLabelText
				BigLabelContent.TextSize = 12
				BigLabelContent.Font = Enum.Font.GothamSemibold
				BigLabelContent.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(-5, 0)
				BigLabelContent.Position = UDim2.fromOffset(5, 0)
				BigLabelContent.Parent = BigLabelContainer

				function BigLabelOptions.SetText(Text)
					BigLabelContent.Text = Text
				end
				return BigLabelOptions
			end

			function OptionLibrary.KeyBind(KeyBindConfig)
                local BindText = KeyBindConfig.Text or "nil KeyBind"
				local BindDef = KeyBindConfig.Def or Enum.KeyCode.One
				local BindCallback = KeyBindConfig.Callback or function() print("nil KeyBind") end
				local BindChangedCallback = KeyBindConfig.ChangedCallback or function() print("Key changed") end
				local Menu = KeyBindConfig.Menu or {}

				local Bind = Objects.new("SmoothButton")
				Bind.Name = "Bind"
				Bind.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
				Bind.ImageColor3 = ThisTheme.Button
				Bind.ImageTransparency = 0
				Bind.Parent = PageContentFrame

				local BindShadow = Objects.new("Shadow")
				BindShadow.ImageColor3 = ThisTheme.Button
				BindShadow.ImageTransparency = 0
				BindShadow.Parent = Bind

				local BindLabel = Objects.new("Label")
				BindLabel.Text = BindText
				BindLabel.TextColor3 = ThisTheme.ButtonAccent
				BindLabel.Font = Enum.Font.GothamSemibold
				BindLabel.TextSize = 14
				BindLabel.ClipsDescendants = true
				BindLabel.TextTransparency = 0
				BindLabel.Parent = Bind

				local Key = BindDef.Name
				local Binding = Objects.new("SmoothButton")
				Binding.Name = "Binding"
				Binding.Size = UDim2.fromOffset(180, 25)
				Binding.Position = UDim2.fromOffset(270, 2.5)
				Binding.ImageColor3 = Color3.fromRGB(45, 45, 45)
				Binding.ImageTransparency = 0
				Binding.Parent = Bind

				local BindingLabel = Objects.new("Label")
				BindingLabel.Text = '[ '..Key..' ]'
				BindingLabel.TextColor3 = ThisTheme.ButtonAccent
				BindingLabel.Font = Enum.Font.GothamSemibold
				BindingLabel.TextSize = 14
				BindingLabel.ClipsDescendants = true
				BindingLabel.TextTransparency = 0
				BindingLabel.TextXAlignment = Enum.TextXAlignment.Center
				BindingLabel.Parent = Binding

				Binding.MouseButton1Down:Connect(function()
					BindingLabel.Text = '[ '..'...'..' ]'
					local InputWait = game:GetService("UserInputService").InputBegan:Wait()
					while InputWait.UserInputType ~= Enum.UserInputType.Keyboard do
						InputWait = game:GetService("UserInputService").InputBegan:Wait()
					end wait()
					local Loop = InputWait.KeyCode == Enum.KeyCode.Unknown and InputWait.UserInputType or InputWait.KeyCode

					if Loop.Name ~= 'Focus' and Loop.Name ~= 'MouseMovement' then
						BindingLabel.Text = '[ '..Loop.Name..' ]'
						Key = Loop.Name
					end
					BindChangedCallback(Loop)
				end)

				game:GetService("UserInputService").InputBegan:connect(function (current)
					local Loop2 = current.KeyCode == Enum.KeyCode.Unknown and current.UserInputType or current.KeyCode
					if Loop2.Name == Key then
						BindCallback()
					end
				end)

				local MenuAdded = TryAddMenu(Bind, Menu, {})
			end

			function OptionLibrary.Slider(SliderConfig)
				local SliderText = SliderConfig.Text or "nil slider"
				local SliderCallback = SliderConfig.Callback or function() print("nil slider") end
				local SliderMin = SliderConfig.Min or 0
				local SliderMax = SliderConfig.Max or 100
				local Menu = SliderConfig.Menu or {}

				if SliderMin > SliderMax then
					local ValueBefore = SliderMin
					SliderMin, SliderMax = SliderMax, ValueBefore
				end

				local SliderDef = math.clamp(SliderConfig.Def, SliderMin, SliderMax) or math.clamp(50, SliderMin, SliderMax)
				local DefaultScale = (SliderDef - SliderMin) / (SliderMax - SliderMin)

				local Slider = Objects.new("Round")
				Slider.Name = "Slider"
				Slider.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 45)
				Slider.ImageColor3 = Theme.Slider
				Slider.ImageTransparency = 1
				Slider.Parent = PageContentFrame

				local SliderShadow = Objects.new("Shadow")
				SliderShadow.ImageColor3 = Theme.Slider
				SliderShadow.ImageTransparency = 1
				SliderShadow.Parent = Slider

				local SliderTitle = Objects.new("Label")
				SliderTitle.TextColor3 = Theme.SliderAccent
				SliderTitle.Text = SliderText
				SliderTitle.TextSize = 16
				SliderTitle.Font = Enum.Font.GothamSemibold
				SliderTitle.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-5, 25)
				SliderTitle.TextTransparency = 1
				SliderTitle.Parent = Slider

				local ValueFrame = Objects.new('Round')
				ValueFrame.ImageColor3 = Color3.fromRGB(45, 45, 45)
				ValueFrame.Position = UDim2.new(0.855, 0, 0.35, 0)
				ValueFrame.Size = UDim2.new(0, 75, 0, 15)
				ValueFrame.ClipsDescendants = false
				ValueFrame.ImageTransparency = 0
				ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueFrame.Parent = Slider

				local SliderValue = Objects.new("Box")
				SliderValue.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				SliderValue.ClipsDescendants = true
				SliderValue.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-5, 25)
				SliderValue.Position = UDim2.new(0.5, 0, 0.5, 0)
				SliderValue.Font = Enum.Font.GothamSemibold
				SliderValue.TextColor3 = Theme.SliderAccent
				SliderValue.TextSize = 14
				SliderValue.TextTransparency = 1
				SliderValue.Text = tostring(SliderDef)
				SliderValue.TextXAlignment = Enum.TextXAlignment.Center
				SliderValue.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderValue.Parent = ValueFrame

				local AddValue = Objects.new('ImageButton')
				AddValue.Name = 'AddValue'
				AddValue.Parent = Slider
				AddValue.BackgroundTransparency = 1
				AddValue.BorderSizePixel = 0
				AddValue.Position = UDim2.new(0.74, 0, 0.35, 0)
				AddValue.Size = UDim2.new(0, 25, 0, 25)
				AddValue.AnchorPoint = Vector2.new(0.5, 0.5)
				AddValue.Image = "http://www.roblox.com/asset/?id=6035047377"
				AddValue.ImageColor3 = Color3.fromRGB(45, 45, 45)

				local RemoveValue = Objects.new('ImageButton')
				RemoveValue.Name = 'RemoveValue'
				RemoveValue.Parent = Slider
				RemoveValue.BackgroundTransparency = 1
				RemoveValue.BorderSizePixel = 0
				RemoveValue.Position = UDim2.new(0.69, 0, 0.35, 0)
				RemoveValue.AnchorPoint = Vector2.new(0.5, 0.5)
				RemoveValue.Size = UDim2.new(0, 25, 0, 25)
				RemoveValue.Image = "http://www.roblox.com/asset/?id=6035067836"
				RemoveValue.ImageColor3 = Color3.fromRGB(45, 45, 45)

				local SliderTracker = Objects.new("Frame")
				SliderTracker.BackgroundColor3 = Theme.SliderAccent
				SliderTracker.BackgroundTransparency = 1
				SliderTracker.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-20, 3)
				SliderTracker.Position = UDim2.fromScale(0, 1) + UDim2.fromOffset(10, -10)
				SliderTracker.Parent = Slider

				local SliderFill = SliderTracker:Clone()
				SliderFill.BackgroundTransparency = 1
				SliderFill.Position = UDim2.fromScale(0, 0)
				SliderFill.Size = UDim2.fromScale(DefaultScale, 1)
				SliderFill.Parent = SliderTracker

				local MinSize = 10
				local MaxSize = 36

				local SizeFromScale = (MinSize + (MaxSize - MinSize)) * DefaultScale
				SizeFromScale = SizeFromScale - (SizeFromScale % 2)

				local SliderDot = Objects.new("CircleButton")
				SliderDot.Size = UDim2.fromOffset(10, 10)
				SliderDot.Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(5, 5)
				SliderDot.ImageColor3 = Theme.SliderAccent
				SliderDot.ImageTransparency = 1
				SliderDot.ZIndex = 50
				SliderDot.Parent = SliderTracker

				local SliderFadedDot = Objects.new("Circle")
				SliderFadedDot.Size = UDim2.fromOffset(SizeFromScale, SizeFromScale)
				SliderFadedDot.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)
				SliderFadedDot.ImageColor3 = Theme.SliderAccent
				SliderFadedDot.ImageTransparency = 1
				SliderFadedDot.ZIndex = 50
				SliderFadedDot.Parent = SliderDot

				game:GetService("TweenService"):Create(Slider, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()
				game:GetService("TweenService"):Create(SliderShadow, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()
				game:GetService("TweenService"):Create(SliderTitle, TweenInfo.new(0.5), { TextTransparency = 0 }):Play()
				game:GetService("TweenService"):Create(SliderValue, TweenInfo.new(0.5), { TextTransparency = 0 }):Play()
				game:GetService("TweenService"):Create(SliderTracker, TweenInfo.new(0.5), { BackgroundTransparency = 0.5 }):Play()
				game:GetService("TweenService"):Create(SliderFill, TweenInfo.new(0.5), { BackgroundTransparency = 0 }):Play()
				game:GetService("TweenService"):Create(SliderDot, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()

				SliderDot.MouseButton1Down:Connect(function()
					game:GetService("TweenService"):Create(SliderFadedDot, TweenInfo.new(0.15), { ImageTransparency = 0.8 }):Play()
					local MouseMove, MouseKill
					MouseMove = Player:GetMouse().Move:Connect(function()
						local Px = GetXY(SliderTracker)
						local SizeFromScale = (MinSize + (MaxSize - MinSize)) * Px
						local Value = math.floor(SliderMin + ((SliderMax - SliderMin) * Px))
						SizeFromScale = SizeFromScale - (SizeFromScale % 2)
						game:GetService("TweenService"):Create(SliderDot, TweenInfo.new(0.15), { Position = UDim2.fromScale(Px, 0.5) - UDim2.fromOffset(5, 5) }):Play()
						game:GetService("TweenService"):Create(SliderFill, TweenInfo.new(0.15), { Size = UDim2.fromScale(Px, 1) }):Play()
						SliderFadedDot.Size = UDim2.fromOffset(SizeFromScale, SizeFromScale)
						SliderFadedDot.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)
						SliderValue.Text = tostring(Value)
						SliderCallback(Value)
					end)
					MouseKill = game:GetService("UserInputService").InputEnded:Connect(function(UserInput)
						if UserInput.UserInputType == Enum.UserInputType.MouseButton1 then
							game:GetService("TweenService"):Create(SliderFadedDot, TweenInfo.new(0.15), { ImageTransparency = 1 }):Play()
							MouseMove:Disconnect()
							MouseKill:Disconnect()
						end
					end)
				end)

				SliderValue.FocusLost:Connect(function()
					if SliderValue.Text == '' or tonumber(SliderValue.Text) == nil then SliderValue.Text = tostring(SliderDef) end
					if tonumber(SliderValue.Text) > SliderMax then SliderValue.Text = tostring(SliderMax) end
					if tonumber(SliderValue.Text) <= SliderMin then SliderValue.Text = tostring(SliderMin) end
					game:GetService("TweenService"):Create(SliderDot, TweenInfo.new(0.15), { Position = UDim2.fromScale((SliderValue.Text or 0) / SliderMax, 0.5) - UDim2.fromOffset(5, 5) }):Play()
					game:GetService("TweenService"):Create(SliderFill, TweenInfo.new(0.15), { Size = UDim2.fromScale((SliderValue.Text or 0) / SliderMax, 1) }):Play()
					SliderValue.Text = tostring(SliderValue.Text)
					SliderCallback(tonumber(SliderValue.Text))
				end)

				AddValue.MouseButton1Click:Connect(function ()
					if SliderValue.Text == '' or tonumber(SliderValue.Text) == nil then SliderValue.Text = tostring(SliderDef) end
					pcall(function ()
						SliderValue.Text = SliderValue.Text + 1
					end)
					if tonumber(SliderValue.Text) > SliderMax then SliderValue.Text = tostring(SliderMax) end
					if tonumber(SliderValue.Text) <= SliderMin then SliderValue.Text = tostring(SliderMin) end
					game:GetService("TweenService"):Create(SliderDot, TweenInfo.new(0.15), { Position = UDim2.fromScale((SliderValue.Text or 0) / SliderMax, 0.5) - UDim2.fromOffset(5, 5) }):Play()
					game:GetService("TweenService"):Create(SliderFill, TweenInfo.new(0.15), { Size = UDim2.fromScale((SliderValue.Text or 0) / SliderMax, 1) }):Play()
					SliderValue.Text = tostring(SliderValue.Text)
					SliderCallback(tonumber(SliderValue.Text))
				end)

				RemoveValue.MouseButton1Click:Connect(function ()
					if SliderValue.Text == '' or tonumber(SliderValue.Text) == nil then SliderValue.Text = tostring(SliderDef) end
					pcall(function ()
						SliderValue.Text = SliderValue.Text - 1
					end)
					if tonumber(SliderValue.Text) > SliderMax then SliderValue.Text = tostring(SliderMax) end
					if tonumber(SliderValue.Text) <= SliderMin then SliderValue.Text = tostring(SliderMin) end
					game:GetService("TweenService"):Create(SliderDot, TweenInfo.new(0.15), { Position = UDim2.fromScale((SliderValue.Text or 0) / SliderMax, 0.5) - UDim2.fromOffset(5, 5) }):Play()
					game:GetService("TweenService"):Create(SliderFill, TweenInfo.new(0.15), { Size = UDim2.fromScale((SliderValue.Text or 0) / SliderMax, 1) }):Play()
					SliderValue.Text = tostring(SliderValue.Text)
					SliderCallback(tonumber(SliderValue.Text))
				end)

				local MenuAdded, MenuButton = TryAddMenu(Slider, Menu, {})
				if MenuAdded then
					SliderValue.Position = SliderValue.Position --[[ - UDim2.fromOffset(25,0)]]
					SliderTracker.Size = SliderTracker.Size - UDim2.fromOffset(20, 0)
					MenuButton.ImageColor3 = Theme.SliderAccent
				end
			end
			return OptionLibrary
		end
		return TabLibrary
	end

    -- Main Codes
    local function Notify(types, ...)
        if types == "Notify" then
            require(game.ReplicatedStorage.Notification).new(...):Display()
        end
    end

    Notify("Notify", tostring('< '..gameName..' >'))
    Notify("Notify", tostring('[ ASTRO HUB ]'))

    -- List Function
    local function getWorld()
        if game.PlaceId == 2753915549 then
            return 'Firstsea'
        elseif game.PlaceId == 4442272183 then
            return 'Secondsea'
        elseif game.PlaceId == 7449423635 then
            return 'Thirdsea'
        else
            return game:GetService('Players').LocalPlayer:Kick('[ ASTRO HUB ]: Game not support!')
        end
    end

    local function Alive()
        if game:GetService('Players').LocalPlayer and game:GetService('Players').LocalPlayer.Character then
            if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Humanoid') and game:GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                if game:GetService('Players').LocalPlayer.Character.Humanoid.Health > 0 then
                    return true
                end
            end
        end
        return false
    end

    local function getWeapon()
        local List = {}
        for i, v in pairs(Player.Character:GetChildren()) do
            if v:IsA'Tool' then
                table.insert(List, v.Name)
            end
        end
        for i, v in pairs(Player.Backpack:GetChildren()) do
            if v:IsA'Tool' then
                table.insert(List, v.Name)
            end
        end
        return List
    end

    local function getPlayer()
        local List = {}
        for i, v in pairs(game:GetService'Players':GetChildren()) do
            table.insert(List, v.Name)
        end
        return List
    end

    local function getBoss()
        local List = {}
        for i, v in pairs(game:GetService'Workspace'.Enemies:GetChildren()) do
            if string.find(v.Name, "Boss") then
                table.insert(List, v.Name)
            end
        end
        return List
    end

    local FruitList = {};
    for i, v in next, game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits") do
        table.insert(FruitList, v.Name)
    end

    -- Stop Camera
    local req = (fluxus and fluxus.request) or (http and http.request) or http_request or request or HttpPost
    --require(game:GetService'Players'.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker).CameraShakeInstance.CameraShakeState = {FadingIn = 3, FadingOut = 2, Sustained = 0, Inactive = 1}
    if game:GetService("ReplicatedStorage").Assets:FindFirstChild('SlashHit') then
        game:GetService("ReplicatedStorage").Assets:FindFirstChild('SlashHit'):Destroy()
    end

    -- Teleport
    if getWorld() == 'Firstsea' then
        islandList = {
            ["Pirate Start"] = CFrame.new(1027.59, 19.3245, 1367.29),
            ["Marine Start"] = CFrame.new(-2684.3, 26.327, 1985.23),
            ["Middle Town"] = CFrame.new(-655.824, 7.85204, 1436.68),
            ["Jungle"] = CFrame.new(-1249.77, 11.852, 341.356),
            ["Pirate Village"] = CFrame.new(-1122.35, 4.75205, 3855.92),
            ["Desert"] = CFrame.new(1094.15, 6.43847, 4192.89),
            ["Frozen Village"] = CFrame.new(1198.01, 26.9725, -1211.73),
            ["MarineFord"] = CFrame.new(-4505.38, 20.6523, 4260.56),
            ["Magma Village"] = CFrame.new(-5231.76, 8.59013, 8467.88),
            ["Sky 1st"] = CFrame.new(-4970.22, 717.672, -2622.35),
            ["Sky 2nd"] = CFrame.new(-4720.46, 854.517, -1943.15),
            ["Sky 3rd"] = CFrame.new(-7886.96, 5545.53, -394.544),
            ["Colosseum"] = CFrame.new(-1428.35, 7.38934, -3014.37),
            ["Prison"] = CFrame.new(4874.81, 5.65199, 735.57),
            ["Fountain City"] = CFrame.new(5213.1, 38.5011, 4095.69),
            ["Mob Island"] = CFrame.new(-2850.2, 7.39225, 5354.99),
        }
    elseif getWorld() == 'Secondsea' then
        islandList = {
            ['First Spot'] = CFrame.new(82.9491, 19.2667, 2834.99),
            ['Cafe'] = CFrame.new(-385.251, 73.0201, 297.388),
            ['Kingdom Of Rose'] = CFrame.new(-195.1, 121.579, 279.9),
            ['Factory'] = CFrame.new(427.452, 211.494, -429.336),
            ['Mansion'] = CFrame.new(-390.096, 331.861, 673.465),
            ['Swan Room'] = CFrame.new(2302.19, 15.152, 663.811),
            ['Dark Arena'] = CFrame.new(3807.1, 14.6502, -3452.2),
            ['Green Bit'] = CFrame.new(-2372.15, 72.9661, -3166.51),
            ['Colosseum'] = CFrame.new(-1836.58, 45.7947, 1360.31),
            ['Ghost Island'] = CFrame.new(-5571.84, 196.388, -795.433),
            ['Ghost Island 2nd'] = CFrame.new(-5930.73, 6.4027, -1189.42),
            ['Snow Mountain'] = CFrame.new(1384.68, 453.512, -4990.1),
            ['Cold Slide'] = CFrame.new(-6026.96, 15.9518, -5071.96),
            ['Magma Slide'] = CFrame.new(-5478.39, 15.9518, -5246.91),
            ['Ice Castle'] = CFrame.new(5400.40381, 28.21698, -6236.99219),
            ['Forgotten Island'] = CFrame.new(-3043.31543, 238.881271, -10191.5791),
            ['Usoapp Island'] = CFrame.new(4748.78857, 8.35370827, 2849.57959),
            ['Minisky Island'] = CFrame.new(-260.358917, 49325.7031, -35259.3008),
            ['Indra Island'] = CFrame.new(-26698, 7.06173, 425.623),
            ['Lap Room'] = CFrame.new(-6436.61, 250.62, -4500.64),
            ['Awakening Room'] = CFrame.new(239.79, -58.382, 1824.44),
        }
    elseif getWorld() == 'Thirdsea' then
        islandList = {
            ["Port Town"] = CFrame.new(-269.081, 6.72994, 5313.31),
            ["Hydra Island"] = CFrame.new(5317.27, 643.111, 336.468),
            ["Secret Temple"] = CFrame.new(5226.1, 6.87257, 1111.05),
            ["Friendly Arena"] = CFrame.new(5227.64, 68.1246, -1453.46),
            ["Great Tree"] = CFrame.new(2267.83, 25.8876, -6600.01),
            ["Castle on the Sea"] = CFrame.new(-4999.45, 318.181, -3010.54),
            ["Rip Indra Boss Room"] = CFrame.new(-5386.29, 335.627, -2565.9),
            ["Mansion"] = CFrame.new(-12549.7, 341.781, -7470.36),
            ["Floating Turtle"] = CFrame.new(-10038.9, 332.096, -8325.16),
            ["Longma Boss Room"] = CFrame.new(-10253.8, 375.099, -9525.49),
            ["Haunted Castle"] = CFrame.new(-9506.11, 142.105, 5526.04),
            ["Soul Reaper Boss Room"] = CFrame.new(-9524.4, 316.233, 6736.14),
            ["Cake Island"] = CFrame.new(-1794.7020263671875, 37.79818344116211, -11938.0986328125),
            ["Sea Of Treats"] = CFrame.new(-891.166, 65.8195, -10901.7),
            ["Peanut Island"] = CFrame.new(-2009.89, 50.79, -9976.35),
            ["Candy Cane"] = CFrame.new(-1047.4837646484375, 16.92081642150879, -14153.80078125),
        }
    end

    local TeleportOptions = {};
    for i, v in pairs(islandList) do
        table.insert(TeleportOptions, i)
    end

    -- Settings
    local Settings = {
        ['TweenSpeed'] = 250;
        ['Team'] = 'Marines';
        ['Farm Weapon'] = '';
        ['Auto Farm'] = false;
        ['Fast Attack'] = true;
        ['Bring Mob'] = true;
    }

    -- Float Func
    local StopRequest = false
    game:GetService("RunService").Stepped:Connect(function ()
        if not Alive() then return end
        if (ManualTween) then
            for _, child in pairs(game:GetService'Players'.LocalPlayer.Character:GetDescendants()) do
                if child:IsA("BasePart") and child.CanCollide == true then
                    child.CanCollide = false
                end
            end
            if not game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("SafeFloat") then
                local BV = Instance.new("BodyVelocity")
                BV.Parent = game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart
                BV.Name = "SafeFloat"
                BV.MaxForce = Vector3.new(100000, 100000, 100000)
                BV.Velocity = Vector3.new(0, 0, 0)
            end
        elseif game:GetService'Players'.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("SafeFloat") then
            game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.SafeFloat:Destroy()
        end
    end)

    function Tween(pos)
        if not Alive() then return end
        if game:GetService'Players'.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - pos.p).magnitude < 100 then game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = pos return end
        pcall(function ()
            if (game:GetService'Players'.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y - pos.p.Y).magnitude > 50 then game:GetService'Players'.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame.Y = pos.Y wait(1) return end
            TP(pos, true)
        end)
    end

    function TP(pos, float)
        if not Alive() then return end
        if float == nil then float = false end
        pcall(function ()
            if float then ManualTween = true end
            local Info = TweenInfo.new((game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - pos.p).magnitude / Settings['TweenSpeed'], Enum.EasingStyle.Linear)
            local T = game:GetService"TweenService":Create(game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), Info, {CFrame = pos})
            doneTween = false
            T.Completed:Connect(function ()
                doneTween = true
            end)
            T:Play()

            while (doneTween == false) do wait()
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                if (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - pos.p).magnitude <= 100 then
                    T:Pause()
                    if float and ManualTween then ManualTween = false end
                    game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
                    return
                end
                if StopRequest then StopRequest = false
                    T:Pause()
                    if float and ManualTween then ManualTween = false end
                    return
                end
            end
        end)
    end

    function StopTween()
        if not StopRequest then
            StopRequest = true
        end
    end

    function Equip(toolName)
        if game:GetService'Players'.LocalPlayer.Backpack:FindFirstChild(toolName) then
            game:GetService'Players'.LocalPlayer.Character.Humanoid:EquipTool(game:GetService'Players'.LocalPlayer.Backpack:FindFirstChild(toolName))
        end
    end

    -- Set Team
    if game:GetService'Players'.LocalPlayer.PlayerGui.Main:FindFirstChild('ChooseTeam') and game:GetService'Players'.LocalPlayer.PlayerGui.Main.ChooseTeam.Visible == true then
        for i, v in pairs(getconnections(game:GetService'Players'.LocalPlayer.PlayerGui.Main.ChooseTeam.Container[Settings['Team']].Frame.ViewportFrame.TextButton.Activated)) do
            v.Function()
        end
    end

    -- Server
    spawn(function ()
        while task.wait() do
            pcall(function ()
                for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v:FindFirstChild("Humanoid") ~= nil  and v:FindFirstChild("HumanoidRootPart") ~= nil and v:IsA("Model") then
                        v.Parent = game:GetService("Workspace").Enemies
                    end
                end
            end)
        end
    end)

    function CheckQuest()
        local MyLevel = game:GetService'Players'.LocalPlayer.Data.Level.value
        if (Settings['Auto Farm'] == false) then
            newMagnet = false
            newBring = nil
            nameMob = ''
            nameQuest = ''
            levelQuest = 1
            nameMon = ''
            posQuest = nil
            return
        end
        if getWorld() == 'Firstsea' then
            if (MyLevel == 1 or MyLevel <= 9) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Bandit [Lv. 5]') then
                newMagnet = true
                newBring = Vector3.new(1147.8540039062, 16.43285369873, 1603.5220947266)
                nameMob = "Bandit [Lv. 5]"
                nameQuest = "BanditQuest1"
                levelQuest = 1
                nameMon = "Bandits"
                posQuest = Vector3.new(1060.21, 16.4858, 1547.41)
            elseif (MyLevel == 10 or MyLevel <= 14) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Monkey [Lv. 14]') then
                newMagnet = true
                newBring = Vector3.new(-1525.0627441406, 15.852104187012, 158.00302124023)
                nameMob = "Monkey [Lv. 14]"
                nameQuest = "JungleQuest"
                levelQuest = 1
                nameMon = "Monkey"
                posQuest = Vector3.new(-1601.98, 36.8521, 153.451)
            elseif (MyLevel == 15 or MyLevel <= 29) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Gorilla [Lv. 20]') then
                newMagnet = true
                newBring = Vector3.new(-1240.1945800781, 6.2793760299683, -516.8212890625)
                nameMob = "Gorilla [Lv. 20]"
                nameQuest = "JungleQuest"
                levelQuest = 2
                nameMon = "Gorilla"
                posQuest = Vector3.new(-1601.98, 36.8521, 153.451)
            elseif (MyLevel == 30 or MyLevel <= 39) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Pirate [Lv. 35]') then
                newMagnet = true
                newBring = Vector3.new(-1107.7532958984, 29.035329818726, 3928.2072753906)
                nameMob = "Pirate [Lv. 35]"
                nameQuest = "BuggyQuest1"
                levelQuest = 1
                nameMon = "Pirate"
                posQuest = Vector3.new(-1140.17, 4.75205, 3828.02)
            elseif (MyLevel == 40 or MyLevel <= 59) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Brute [Lv. 45]') then
                newMagnet = true
                newBring = Vector3.new(-1066.5609130859, 14.869885444641, 4300.2099609375)
                nameMob = "Brute [Lv. 45]"
                nameQuest = "BuggyQuest1"
                levelQuest = 2
                nameMon = "Brute"
                posQuest = Vector3.new(-1140.17, 4.75205, 3828.02)
            elseif (MyLevel == 60 or MyLevel <= 74) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Desert Bandit [Lv. 60]') then
                newMagnet = true
                newBring = Vector3.new(936.67834472656, 6.4502120018005, 4482.0478515625)
                nameMob = "Desert Bandit [Lv. 60]"
                nameQuest = "DesertQuest"
                levelQuest = 1
                nameMon = "Desert Bandit"
                posQuest = Vector3.new(896.676, 6.43846, 4389.51)
            elseif (MyLevel == 75 or MyLevel <= 89) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Desert Officer [Lv. 70]') then
                newMagnet = true
                newBring = Vector3.new(1599.9666748047, 3.5756180286407, 4411.7104492188)
                nameMob = "Desert Officer [Lv. 70]"
                nameQuest = "DesertQuest"
                levelQuest = 2
                nameMon = "Desert Officer"
                posQuest = Vector3.new(896.676, 6.43846, 4389.51)
            elseif (MyLevel == 90 or MyLevel <= 99) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Snow Bandit [Lv. 90]') then
                newMagnet = true
                newBring = Vector3.new(1347.3096923828, 87.272773742676, -1424.1986083984)
                nameMob = "Snow Bandit [Lv. 90]"
                nameQuest = "SnowQuest"
                levelQuest = 1
                nameMon = "Snow Bandits"
                posQuest = Vector3.new(1386.27, 87.2728, -1299.83)
            elseif (MyLevel == 100 or MyLevel <= 119) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Snowman [Lv. 100]') then
                newMagnet = true
                newBring = Vector3.new(1153.9439697266, 106.35020446777, -1496.6317138672)
                nameMob = "Snowman [Lv. 100]"
                nameQuest = "SnowQuest"
                levelQuest = 2
                nameMon = "Snowman"
                posQuest = Vector3.new(1386.27, 87.2728, -1299.83)
            elseif (MyLevel == 120 or MyLevel <= 149) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Chief Petty Officer [Lv. 120]') then
                newMagnet = false
                nameMob = "Chief Petty Officer [Lv. 120]"
                nameQuest = "MarineQuest2"
                levelQuest = 1
                nameMon = "Chief Petty Officer"
                posQuest = Vector3.new(-5036.07, 28.652, 4324.89)
            elseif (MyLevel == 150 or MyLevel <= 174) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Sky Bandit [Lv. 150]') then
                newMagnet = true
                newBring = Vector3.new(-4997.6875, 278.06686401367, -2857.2641601562)
                nameMob = "Sky Bandit [Lv. 150]"
                nameQuest = "SkyQuest"
                levelQuest = 1
                nameMon = "Sky Bandit"
                posQuest = Vector3.new(-4841.2, 717.67, -2622.72)
            elseif (MyLevel == 175 or MyLevel <= 224) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Dark Master [Lv. 175]') then
                newMagnet = true
                newBring = Vector3.new(-5252.880859375, 388.65194702148, -2243.8149414062)
                nameMob = "Dark Master [Lv. 175]"
                nameQuest = "SkyQuest"
                levelQuest = 2
                nameMon = "Dark Master"
                posQuest = Vector3.new(-4841.2, 717.67, -2622.72)
            elseif (MyLevel == 225 or MyLevel <= 274) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Toga Warrior [Lv. 225]') then
                newMagnet = true
                newBring = Vector3.new(-1876.8149414062, 7.2890849113464, -2775.1943359375)
                nameMob = "Toga Warrior [Lv. 225]"
                nameQuest = "ColosseumQuest"
                levelQuest = 1
                nameMon = "Toga Warrior"
                posQuest = Vector3.new(-1576.79, 7.38934, -2984.77)
            elseif (MyLevel == 275 or MyLevel <= 299) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Gladiator [Lv. 275]') then
                newMagnet = true
                newBring = Vector3.new(-1293.4926757812, 7.4425563812256, -3211.8747558594)
                nameMob = "Gladiator [Lv. 275]"
                nameQuest = "ColosseumQuest"
                levelQuest = 2
                nameMon = "Gladiato"
                posQuest = Vector3.new(-1576.79, 7.38934, -2984.77)
            elseif (MyLevel == 300 or MyLevel <= 329) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Military Soldier [Lv. 300]') then
                newMagnet = true
                newBring = Vector3.new(-5492.0751953125, 8.5906858444214, 8467.4755859375)
                nameMob = "Military Soldier [Lv. 300]"
                nameQuest = "MagmaQuest"
                levelQuest = 1
                nameMon = "Military Soldier"
                posQuest = Vector3.new(-5315.57, 12.2369, 8516.53)
            elseif (MyLevel == 300 or MyLevel <= 374) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Military Spy [Lv. 330]') then
                newMagnet = true
                newBring = Vector3.new(-5849.9594726562, 77.230659484863, 8825.0234375)
                nameMob = "Military Spy [Lv. 330]"
                nameQuest = "MagmaQuest"
                levelQuest = 2
                nameMon = "Military Spy"
                posQuest = Vector3.new(-5315.57, 12.2369, 8516.53)
            elseif (MyLevel == 375 or MyLevel <= 399) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Fishman Warrior [Lv. 375]') then
                newMagnet = true
                newBring = Vector3.new(60886.08984375, 18.482833862305, 1518.1516113281)
                nameMob = "Fishman Warrior [Lv. 375]"
                nameQuest = "FishmanQuest"
                levelQuest = 1
                nameMon = "Fishman Warrior"
                posQuest = Vector3.new(61122.2, 18.4716, 1566.93)
                if (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 5000 and (Settings['AutoFarm'] or Settings['CustomFarm']) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end
            elseif (MyLevel == 400 or MyLevel <= 449) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Fishman Commando [Lv. 400]') then
                newMagnet = true
                newBring = Vector3.new(61853.859375, 18.482830047607, 1486.4224853516)
                nameMob = "Fishman Commando [Lv. 400]"
                nameQuest = "FishmanQuest"
                levelQuest = 2
                nameMon = "Fishman Commando"
                posQuest = Vector3.new(61122.2, 18.4716, 1566.93)
                if (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 5000 and (Settings['AutoFarm'] or Settings['CustomFarm']) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end
            elseif (MyLevel == 450 or MyLevel <= 474) or (Settings['CustomFarm'] and Settings['CustomMob'] == "God's Guard [Lv. 450]") then
                newMagnet = true
                newBring = Vector3.new(-4723.9750976562, 845.27697753906, -1922.9019775391)
                nameMob = "God's Guard [Lv. 450]"
                nameQuest = "SkyExp1Quest"
                levelQuest = 1
                nameMon = "God's Guards"
                posQuest = Vector3.new(-4721.67, 845.277, -1952.91)
                if (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 5000 and (Settings['AutoFarm'] or Settings['CustomFarm']) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.6884765625, 6.7369503974915, -1926.2141113281))
                end
            elseif (MyLevel == 475 or MyLevel <= 524) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Shanda [Lv. 475]') then
                newMagnet = true
                newBring = Vector3.new(-7681.6166992188, 5545.4916992188, -509.5068359375)
                nameMob = "Shanda [Lv. 475]"
                nameQuest = "SkyExp1Quest"
                levelQuest = 2
                nameMon = "Shandas"
                posQuest = Vector3.new(-7862.7583007812, 5545.4916992188, -379.44604492188)
            elseif (MyLevel == 525 or MyLevel <= 549) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Royal Squad [Lv. 525]') then
                newMagnet = true
                newBring = Vector3.new(-7672.8388671875, 5606.876953125, -1459.5698242188)
                nameMob = "Royal Squad [Lv. 525]"
                nameQuest = "SkyExp2Quest"
                levelQuest = 1
                nameMon = "Royal Squad"
                posQuest = Vector3.new(-7904.17, 5635.96, -1412.22)
            elseif (MyLevel == 550 or MyLevel <= 624) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Royal Soldier [Lv. 550]') then
                newMagnet = true
                newBring = Vector3.new(-7856.1606445312, 5606.876953125, -1762.4923095703)
                nameMob = "Royal Soldier [Lv. 550]"
                nameQuest = "SkyExp2Quest"
                levelQuest = 2
                nameMon = "Royal Soldier"
                posQuest = Vector3.new(-7904.17, 5635.96, -1412.22)
            elseif (MyLevel == 625 or MyLevel <= 649) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Galley Pirate [Lv. 625]') then
                newMagnet = true
                newBring = Vector3.new(5569.72265625, 41.50138092041, 3963.0612792969)
                nameMob = "Galley Pirate [Lv. 625]"
                nameQuest = "FountainQuest"
                levelQuest = 1
                nameMon = "Galley Pirate"
                posQuest = Vector3.new(5256.18, 38.5011, 4049.5)
            elseif MyLevel >= 650 or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Galley Captain [Lv. 650]') then
                newMagnet = false
                nameMob = "Galley Captain [Lv. 650]"
                nameQuest = "FountainQuest"
                levelQuest = 2
                nameMon = "Galley Captain"
                posQuest = Vector3.new(5256.18, 38.5011, 4049.5)
            end
        elseif getWorld() == 'Secondsea' then
            if (MyLevel == 700 or MyLevel <= 724) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Raider [Lv. 700]') then
                newMagnet = false
                nameMob = "Raider [Lv. 700]"
                nameQuest = "Area1Quest"
                levelQuest = 1
                nameMon = "Raiders"
                posQuest = Vector3.new(-426.167, 72.9705, 1836.96)
            elseif (MyLevel == 725 or MyLevel <= 774) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Mercenary [Lv. 725]') then
                newMagnet = false
                nameMob = "Mercenary [Lv. 725]"
                nameQuest = "Area1Quest"
                levelQuest = 2
                nameMon = "Mercenary"
                posQuest = Vector3.new(-426.167, 72.9705, 1836.96)
            elseif (MyLevel == 775 or MyLevel <= 799) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Swan Pirate [Lv. 775]') then
                newMagnet = true
                newBring = Vector3.new(965.49987792969, 72.95972442627, 1261.7962646484)
                nameMob = "Swan Pirate [Lv. 775]"
                nameQuest = "Area2Quest"
                levelQuest = 1
                nameMon = "Swan Pirate"
                posQuest = Vector3.new(635.88, 73.0705, 917.753)
            elseif (MyLevel == 800 or MyLevel <= 874) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Factory Staff [Lv. 800]') then
                newMagnet = false
                nameMob = "Factory Staff [Lv. 800]"
                nameQuest = "Area2Quest"
                levelQuest = 2
                nameMon = "Factory Staff"
                posQuest = Vector3.new(635.88, 73.0705, 917.753)
            elseif (MyLevel == 875 or MyLevel <= 899) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Marine Lieutenant [Lv. 875]') then
                newMagnet = false
                nameMob = "Marine Lieutenant [Lv. 875]"
                nameQuest = "MarineQuest3"
                levelQuest = 1
                nameMon = "Marine Lieutenant"
                posQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
            elseif (MyLevel == 900 or MyLevel <= 949) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Marine Captain [Lv. 900]') then
                newMagnet = true
                newBring = Vector3.new(-1882.2608642578, 72.96614074707, -3319.6901855469)
                nameMob = "Marine Captain [Lv. 900]"
                nameQuest = "MarineQuest3"
                levelQuest = 2
                nameMon = "Marine Captain"
                posQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
            elseif (MyLevel == 950 or MyLevel <= 974) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Zombie [Lv. 950]') then
                newMagnet = true
                newBring = Vector3.new(-5678.5166015625, 48.480136871338, -842.40716552734)
                nameMob = "Zombie [Lv. 950]"
                nameQuest = "ZombieQuest"
                levelQuest = 1
                nameMon = "Zombie"
                posQuest = Vector3.new(-5494.52, 48.4801, -794.279)
            elseif (MyLevel == 975 or MyLevel <= 999) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Vampire [Lv. 975]') then
                newMagnet = false
                nameMob = "Vampire [Lv. 975]"
                nameQuest = "ZombieQuest"
                levelQuest = 2
                nameMon = "Vampire"
                posQuest = Vector3.new(-5494.52, 48.4801, -794.279)
            elseif (MyLevel == 1000 or MyLevel <= 1049) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Snow Trooper [Lv. 1000]') then
                newMagnet = true
                newBring = Vector3.new(569.79888916016, 401.42193603516, -5544.6586914062)
                nameMob = "Snow Trooper [Lv. 1000]"
                nameQuest = "SnowMountainQuest"
                levelQuest = 1
                nameMon = "Snow Trooper"
                posQuest = Vector3.new(606.809, 401.412, -5370.44)
            elseif (MyLevel == 1050 or MyLevel <= 1099) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Winter Warrior [Lv. 1050]') then
                newMagnet = true
                newBring = Vector3.new(1242.4265136719, 429.421875, -5228.7607421875)
                nameMob = "Winter Warrior [Lv. 1050]"
                nameQuest = "SnowMountainQuest"
                levelQuest = 2
                nameMon = "Winter Warrior"
                posQuest = Vector3.new(606.809, 401.412, -5370.44)
            elseif (MyLevel == 1100 or MyLevel <= 1124) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Lab Subordinate [Lv. 1100]') then
                newMagnet = true
                newBring = Vector3.new(-5754.5395507812, 15.951766967773, -4461.1059570312)
                nameMob = "Lab Subordinate [Lv. 1100]"
                nameQuest = "IceSideQuest"
                levelQuest = 1
                nameMon = "Lab Subordinate"
                posQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
            elseif (MyLevel == 1125 or MyLevel <= 1174) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Horned Warrior [Lv. 1125]') then
                newMagnet = false
                nameMob = "Horned Warrior [Lv. 1125]"
                nameQuest = "IceSideQuest"
                levelQuest = 2
                nameMon = "Horned Warrior"
                posQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
            elseif (MyLevel == 1175 or MyLevel <= 1199) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Magma Ninja [Lv. 1175]') then
                newMagnet = false
                nameMob = "Magma Ninja [Lv. 1175]"
                nameQuest = "FireSideQuest"
                levelQuest = 1
                nameMon = "Magma Ninja"
                posQuest = Vector3.new(-5429.32, 15.9418, -5296.55)
            elseif (MyLevel == 1200 or MyLevel <= 1249) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Lava Pirate [Lv. 1200]') then
                newMagnet = false
                nameMob = "Lava Pirate [Lv. 1200]"
                nameQuest = "FireSideQuest"
                levelQuest = 2
                nameMon = "Lava Pirate"
                posQuest = Vector3.new(-5429.32, 15.9418, -5296.55)
            elseif (MyLevel == 1250 or MyLevel <= 1274) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Ship Deckhand [Lv. 1250]') then
                newMagnet = true
                newBring = Vector3.new(1161.4685058594, 125.72914123535, 33040.34765625)
                nameMob = "Ship Deckhand [Lv. 1250]"
                nameQuest = "ShipQuest1"
                levelQuest = 1
                nameMon = "Ship Deckhand"
                posQuest = Vector3.new(1038.57, 125.057, 32911.3)
                if (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 5000 and (Settings['AutoFarm'] or Settings['CustomFarm']) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif (MyLevel == 1275 or MyLevel <= 1299) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Ship Engineer [Lv. 1275]') then
                newMagnet = true
                newBring = Vector3.new(871.96636962891, 40.442874908447, 32918.5234375)
                nameMob = "Ship Engineer [Lv. 1275]"
                nameQuest = "ShipQuest1"
                levelQuest = 2
                nameMon = "Ship Engineer"
                posQuest = Vector3.new(1038.57, 125.057, 32911.3)
                if (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 5000 and (Settings['AutoFarm'] or Settings['CustomFarm']) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif (MyLevel == 1300 or MyLevel <= 1324) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Ship Steward [Lv. 1300]') then
                newMagnet = true
                newBring = Vector3.new(919.00793457031, 125.18640899658, 33431.87109375)
                nameMob = "Ship Steward [Lv. 1300]"
                nameQuest = "ShipQuest2"
                levelQuest = 1
                nameMon = "Ship Steward"
                posQuest = Vector3.new(970.202, 125.057, 33245.8)
                if (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 5000 and (Settings['AutoFarm'] or Settings['CustomFarm']) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif (MyLevel == 1325 or MyLevel <= 1349) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Ship Officer [Lv. 1325]') then
                newMagnet = false
                nameMob = "Ship Officer [Lv. 1325]"
                nameQuest = "ShipQuest2"
                levelQuest = 2
                nameMon = "Ship Officer"
                posQuest = Vector3.new(970.202, 125.057, 33245.8)
                if (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 5000 and (Settings['AutoFarm'] or Settings['CustomFarm']) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif (MyLevel == 1350 or MyLevel <= 1374) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Arctic Warrior [Lv. 1350]') then
                newMagnet = true
                newBring = Vector3.new(6057.9716796875, 28.367464065552, -6207.9775390625)
                nameMob = "Arctic Warrior [Lv. 1350]"
                nameQuest = "FrostQuest"
                levelQuest = 1
                nameMon = "Arctic Warrior"
                posQuest = Vector3.new(5669.22, 28.1667, -6483.55)
                if (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 5000 and (Settings['AutoFarm'] or Settings['CustomFarm']) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                end
            elseif (MyLevel == 1375 or MyLevel <= 1424) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Snow Lurker [Lv. 1375]') then
                newMagnet = true
                newBring = Vector3.new(5577.73828125, 36.615375518799, -6803.0673828125)
                nameMob = "Snow Lurker [Lv. 1375]"
                nameQuest = "FrostQuest"
                levelQuest = 2
                nameMon = "Snow Lurker"
                posQuest = Vector3.new(5669.22, 28.1667, -6483.55)
            elseif (MyLevel == 1425 or MyLevel <= 1449) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Sea Soldier [Lv. 1425]') then
                newMagnet = true
                newBring = Vector3.new(-3384.0056152344, 26.949884414673, -9791.5244140625)
                nameMob = "Sea Soldier [Lv. 1425]"
                nameQuest = "ForgottenQuest"
                levelQuest = 1
                nameMon = "Sea Soldier"
                posQuest = Vector3.new(-3053.65, 236.836, -10145.4)
            elseif MyLevel >= 1450 or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Water Fighter [Lv. 1450]') then
                newMagnet = true
                newBring = Vector3.new(-3422.9406738281, 238.84616088867, -10527.375976562)
                nameMob = "Water Fighter [Lv. 1450]"
                nameQuest = "ForgottenQuest"
                levelQuest = 2
                nameMon = "Water Fighter"
                posQuest = Vector3.new(-3053.65, 236.836, -10145.4)
            end
        elseif getWorld() == 'Thirdsea' then
            if (MyLevel == 1500 or MyLevel <= 1524) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Pirate Millionaire [Lv. 1500]') then
                newMagnet = true
                newBring = Vector3.new(-581.28082275391, 43.810558319092, 5536.3989257812)
                nameMob = "Pirate Millionaire [Lv. 1500]"
                nameQuest = "PiratePortQuest"
                levelQuest = 1
                nameMon = "Pirate Millionaire"
                posQuest = Vector3.new(-290.075, 42.9035, 5581.59)
            elseif (MyLevel == 1525 or MyLevel <= 1574) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Pistol Billionaire [Lv. 1525]') then
                newMagnet = true
                newBring = Vector3.new(-87.6279296875, 73.729927062988, 6033.1821289062)
                nameMob = "Pistol Billionaire [Lv. 1525]"
                nameQuest = "PiratePortQuest"
                levelQuest = 2
                nameMon = "Pistol Billionaire"
                posQuest = Vector3.new(-290.075, 42.9035, 5581.59)
            elseif (MyLevel == 1575 or MyLevel <= 1599) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Dragon Crew Warrior [Lv. 1575]') then
                newMagnet = false
                nameMob = "Dragon Crew Warrior [Lv. 1575]"
                nameQuest = "AmazonQuest"
                levelQuest = 1
                nameMon = "Dragon Crew Warrior"
                posQuest = Vector3.new(5832.84, 51.6806, -1101.52)
            elseif (MyLevel == 1600 or MyLevel <= 1624) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Dragon Crew Archer [Lv. 1600]') then
                newMagnet = true
                newBring = Vector3.new(6591.8999023438, 378.40170288086, 121.26614379883)
                nameMob = "Dragon Crew Archer [Lv. 1600]"
                nameQuest = "AmazonQuest"
                levelQuest = 2
                nameMon = "Dragon Crew Archer"
                posQuest = Vector3.new(5832.84, 51.6806, -1101.52)
            elseif (MyLevel == 1625 or MyLevel <= 1649) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Female Islander [Lv. 1625]') then
                newMagnet = false
                nameMob = "Female Islander [Lv. 1625]"
                nameQuest = "AmazonQuest2"
                levelQuest = 1
                nameMon = "Female Islander"
                posQuest = Vector3.new(5448.86, 601.516, 751.131)
            elseif (MyLevel == 1650 or MyLevel <= 1699) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Giant Islander [Lv. 1650]') then
                newMagnet = true
                newBring = Vector3.new(4964.5634765625, 590.43676757812, -128.22416687012)
                nameMob = "Giant Islander [Lv. 1650]"
                nameQuest = "AmazonQuest2"
                levelQuest = 2
                nameMon = "Giant Islander"
                posQuest = Vector3.new(5448.86, 601.516, 751.131)
            elseif (MyLevel == 1700 or MyLevel <= 1724) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Marine Commodore [Lv. 1700]') then
                newMagnet = false
                nameMob = "Marine Commodore [Lv. 1700]"
                nameQuest = "MarineTreeIsland"
                levelQuest = 1
                nameMon = "Marine Commodore"
                posQuest = Vector3.new(2180.54, 27.8157, -6741.55)
            elseif (MyLevel == 1725 or MyLevel <= 1774) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Marine Rear Admiral [Lv. 1725]') then
                newMagnet = true
                newBring = Vector3.new(3676.7690429688, 160.52404785156, -7037.4633789062)
                nameMob = "Marine Rear Admiral [Lv. 1725]"
                nameQuest = "MarineTreeIsland"
                levelQuest = 2
                nameMon = "Marine Rear Admiral"
                posQuest = Vector3.new(2180.54, 27.8157, -6741.55)
            elseif (MyLevel == 1775 or MyLevel <= 1799) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Fishman Raider [Lv. 1775]') then
                newMagnet = true
                newBring = Vector3.new(-10533.643554688, 331.76260375977, -8426.951171875)
                nameMob = "Fishman Raider [Lv. 1775]"
                nameQuest = "DeepForestIsland3"
                levelQuest = 1
                nameMon = "Fishman Raider"
                posQuest = Vector3.new(-10581.7, 330.873, -8761.19)
            elseif (MyLevel == 1800 or MyLevel <= 1824) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Fishman Captain [Lv. 1800]') then
                newMagnet = true
                newBring = Vector3.new(-11004.96484375, 331.76266479492, -8943.8681640625)
                nameMob = "Fishman Captain [Lv. 1800]"
                nameQuest = "DeepForestIsland3"
                levelQuest = 2
                nameMon = "Fishman Captain"
                posQuest = Vector3.new(-10581.7, 330.873, -8761.19)
            elseif (MyLevel == 1825 or MyLevel <= 1849) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Forest Pirate [Lv. 1825]') then
                newMagnet = true
                newBring = Vector3.new(-13361.370117188, 332.37811279297, -7806.1791992188)
                nameMob = "Forest Pirate [Lv. 1825]"
                nameQuest = "DeepForestIsland"
                levelQuest = 1
                nameMon = "Forest Pirate"
                posQuest = Vector3.new(-13234, 331.488, -7625.4)
            elseif (MyLevel == 1850 or MyLevel <= 1899) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Mythological Pirate [Lv. 1850]') then
                newMagnet = true
                newBring = Vector3.new(-13572.616210938, 469.78540039062, -6891.2856445312)
                nameMob = "Mythological Pirate [Lv. 1850]"
                nameQuest = "DeepForestIsland"
                levelQuest = 2
                nameMon = "Mythological Pirate"
                posQuest = Vector3.new(-13234, 331.488, -7625.4)
            elseif (MyLevel == 1900 or MyLevel <= 1924) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Jungle Pirate [Lv. 1900]') then
                newMagnet = false
                nameMob = "Jungle Pirate [Lv. 1900]"
                nameQuest = "DeepForestIsland2"
                levelQuest = 1
                nameMon = "Jungle Pirate"
                posQuest = Vector3.new(-12680.4, 389.971, -9902.02)
            elseif (MyLevel == 1925 or MyLevel <= 1974) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Musketeer Pirate [Lv. 1925]') then
                newMagnet = true
                newBring = Vector3.new(-13286.615234375, 391.54565429688, -9765.8134765625)
                nameMob = "Musketeer Pirate [Lv. 1925]"
                nameQuest = "DeepForestIsland2"
                levelQuest = 2
                nameMon = "Musketeer Pirate"
                posQuest = Vector3.new(-12680.4, 389.971, -9902.02)
            elseif (MyLevel == 1975 or MyLevel <= 1999) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Reborn Skeleton [Lv. 1975]') then
                newMagnet = true
                newBring = Vector3.new(-8762.44, 142.131, 6002.3)
                nameMob = "Reborn Skeleton [Lv. 1975]"
                nameQuest = "HauntedQuest1"
                levelQuest = 1
                nameMon = "Reborn Skeleton"
                posQuest = Vector3.new(-9479.22, 141.215, 5566.09)
            elseif (MyLevel == 2000 or MyLevel <= 2024) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Living Zombie [Lv. 2000]') then
                newMagnet = true
                newBring = Vector3.new(-10153.4, 139.652, 5936.71)
                nameMob = "Living Zombie [Lv. 2000]"
                nameQuest = "HauntedQuest1"
                levelQuest = 2
                nameMon = "Living Zombie"
                posQuest = Vector3.new(-9479.22, 141.215, 5566.09)
            elseif (MyLevel == 2025 or MyLevel <= 2049) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Demonic Soul [Lv. 2025]') then
                newMagnet = true
                newBring = Vector3.new(-9500.8671875, 172.10485839844, 6141.5073242188)
                nameMob = "Demonic Soul [Lv. 2025]"
                nameQuest = "HauntedQuest2"
                levelQuest = 1
                nameMon = "Demonic Soul"
                posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
            elseif (MyLevel >= 2050 and MyLevel <= 2074) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Posessed Mummy [Lv. 2050]') then
                newMagnet = true
                newBring = Vector3.new(-9573.1, 5.81833, 6197.55)
                nameMob = "Posessed Mummy [Lv. 2050]"
                nameQuest = "HauntedQuest2"
                levelQuest = 2
                nameMon = "Posessed Mummy"
                posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
            elseif (MyLevel >= 2075 and MyLevel <= 2099) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Peanut Scout [Lv. 2075]') then
                newMagnet = true
                newBring = Vector3.new(-2203.7, 38.13, -10124.15)
                nameMob = "Peanut Scout [Lv. 2075]"
                nameQuest = "NutsIslandQuest"
                levelQuest = 1
                nameMon = "Peanut Scout"
                posQuest = Vector3.new(-2102.57, 38.1038, -10192.5)
            elseif (MyLevel >= 2100 and MyLevel <= 2124) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Peanut President [Lv. 2100]') then
                newMagnet = true
                newBring = Vector3.new(-2135.85, 70.3, -10521.58)
                nameMob = "Peanut President [Lv. 2100]"
                nameQuest = "NutsIslandQuest"
                levelQuest = 2
                nameMon = "Peanut President"
                posQuest = Vector3.new(-2102.57, 38.1038, -10192.5)
            elseif (MyLevel >= 2125 and MyLevel <= 2149) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Ice Cream Chef [Lv. 2125]') then
                newMagnet = true
                newBring = Vector3.new(-835.99877929688, 65.819557189941, -10979.064453125)
                nameMob = "Ice Cream Chef [Lv. 2125]"
                nameQuest = "IceCreamIslandQuest"
                levelQuest = 1
                nameMon = "Ice Cream Chef"
                posQuest = Vector3.new(-821.255, 65.8195, -10965.2)
            elseif (MyLevel >= 2150 and MyLevel <= 2199) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Ice Cream Commander [Lv. 2150]') then
                newMagnet = true
                newBring = Vector3.new(-633.05151367188, 65.819541931152, -11294.91015625)
                nameMob = "Ice Cream Commander [Lv. 2150]"
                nameQuest = "IceCreamIslandQuest"
                levelQuest = 2
                nameMon = "Ice Cream Commander"
                posQuest = Vector3.new(-821.255, 65.8195, -10965.2)
            elseif (MyLevel >= 2200 and MyLevel <= 2224) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Cookie Crafter [Lv. 2200]') then
                newMagnet = true
                newBring = Vector3.new(-2345.493896484375, 37.798133850097656, -12095.3525390625)
                nameMob = 'Cookie Crafter [Lv. 2200]'
                nameQuest = 'CakeQuest1'
                levelQuest = 1
                nameMon = 'Cookie Crafter'
                posQuest = Vector3.new(-2022.1815185546875, 37.7982292175293, -12029.2041015625)
            elseif (MyLevel >= 2225 and MyLevel <= 2249) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Cake Guard [Lv. 2225]') then
                newMagnet = true
                newBring = Vector3.new(-1574.544677734375, 37.79810333251953, -12373.103515625)
                nameMob = 'Cake Guard [Lv. 2225]'
                nameQuest = 'CakeQuest1'
                levelQuest = 2
                nameMon = 'Cake Guard'
                posQuest = Vector3.new(-2022.1815185546875, 37.7982292175293, -12029.2041015625)
            elseif (MyLevel >= 2250 and MyLevel <= 2274) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Baking Staff [Lv. 2250]') then
                newMagnet = true
                newBring = Vector3.new(-1859.37744140625, 37.798194885253906, -12949.9814453125)
                nameMob = 'Baking Staff [Lv. 2250]'
                nameQuest = 'CakeQuest2'
                levelQuest = 1
                nameMon = 'Baking Staff'
                posQuest = Vector3.new(-1927.3353271484375, 37.79814529418945, -12842.5400390625)
            elseif (MyLevel >= 2275 and MyLevel <= 2299) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Head Baker [Lv. 2275]') then
                newMagnet = true
                newBring = Vector3.new(-2220.64306640625, 53.50247573852539, -12866.4384765625)
                nameMob = 'Head Baker [Lv. 2275]'
                nameQuest = 'CakeQuest2'
                levelQuest = 2
                nameMon = 'Head Baker'
                posQuest = Vector3.new(-1927.3353271484375, 37.79814529418945, -12842.5400390625)
            elseif (MyLevel >= 2300 and MyLevel <= 2324) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Cocoa Warrior [Lv. 2300]') then
                newMagnet = true
                newBring = Vector3.new(74.89347076416016, 24.76007843017578, -12210.177734375)
                nameMob = 'Cocoa Warrior [Lv. 2300]'
                nameQuest = 'ChocQuest1'
                levelQuest = 1
                nameMon = 'Cocoa Warrior'
                posQuest = Vector3.new(230.9246063232422, 24.760032653808594, -12196.7294921875)
            elseif (MyLevel >= 2325 and MyLevel <= 2349) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Chocolate Bar Battler [Lv. 2325]') then
                newMagnet = true
                newBring = Vector3.new(683.2279663085938, 24.760122299194336, -12602.0654296875)
                nameMob = 'Chocolate Bar Battler [Lv. 2325]'
                nameQuest = 'ChocQuest1'
                levelQuest = 2
                nameMon = 'Chocolate Bar Battler'
                posQuest = Vector3.new(230.9246063232422, 24.760032653808594, -12196.7294921875)
            elseif (MyLevel >= 2350 and MyLevel <= 2374) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Sweet Thief [Lv. 2350]') then
                newMagnet = true
                newBring = Vector3.new(-2.6394715309143066, 24.819705963134766, -12611.521484375)
                nameMob = 'Sweet Thief [Lv. 2350]'
                nameQuest = 'ChocQuest2'
                levelQuest = 1
                nameMon = 'Sweet Thief'
                posQuest = Vector3.new(148.01075744628906, 24.819622039794922, -12775.8251953125)
            elseif (MyLevel >= 2375 and MyLevel <= 2399) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Candy Rebel [Lv. 2375]') then
                newMagnet = true
                newBring = Vector3.new(97.55339813232422, 24.819576263427734, -12958.15625)
                nameMob = 'Candy Rebel [Lv. 2375]'
                nameQuest = 'ChocQuest2'
                levelQuest = 2
                nameMon = 'Candy Rebel'
                posQuest = Vector3.new(148.01075744628906, 24.819622039794922, -12775.8251953125)
            elseif (MyLevel >= 2400 and MyLevel <= 2424) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Candy Pirate [Lv. 2400]') then
                newMagnet = false
                nameMob = 'Candy Pirate [Lv. 2400]'
                nameQuest = 'CandyQuest1'
                levelQuest = 1
                nameMon = 'Candy Pirate'
                posQuest = Vector3.new(-1146.463134765625, 16.232572555541992, -14444.87109375)
            elseif (MyLevel >= 2425 --[[and MyLevel <= 2450]]) or (Settings['CustomFarm'] and Settings['CustomMob'] == 'Snow Demon [Lv. 2425]') then
                newMagnet = false
                nameMob = 'Snow Demon [Lv. 2425]'
                nameQuest = 'CandyQuest1'
                levelQuest = 2
                nameMon = 'Snow Demon'
                posQuest = Vector3.new(-1146.463134765625, 16.232572555541992, -14444.87109375)
            end
        end
    end
    CheckQuest()

    -- GUI
    local Main = AstroLib.Load()
    local Features = Main.New({Title = 'Main'})
    Features.Label({Text = 'Main Features!!'})

    local ExpCodes = {'Redeem All Codes'}
    for i, v in pairs(loadstring(game:HttpGet'https://raw.githubusercontent.com/AstroScripter/ASTRO-HUB/main/testScripts/BF_ExpCodes.lua')()) do
        table.insert(ExpCodes, v)
    end

    Features.Dropdown({Text = 'x2 Exp Codes', Options = ExpCodes, Menu = {
        Description = function ()
            Main.Banner({Text = 'Redeem game code for more exp boost'})
        end}, Callback = function (code)
        if code == 'Redeem All Codes' then
            for i, v in pairs(ExpCodes) do
                if v ~= 'Redeem All Codes' then
                    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v)
                end
            end
        else
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
        end
    end})

    Features.Button({Text = 'Stop Tween', Menu = {
        Description = function ()
            Main.Banner({Text = 'Stop Tweening Function'})
        end}, Callback = function ()
        StopTween()
    end})

    -- Farming
    local Farm = Main.New({Title = 'Auto Farm'})
    Farm.Label({Text = 'Farm Settings!'})
    local AutoFarmWeapon = Farm.Dropdown({Text = 'Select Weapon', Options = getWeapon(), Menu = {
        Description = function ()
            Main.Banner({Text = 'Choose weapon for auto farm function'})
        end}, Callback = function (vu)
        Settings['Farm Weapon'] = vu
    end})

    spawn(function ()
        while wait(1) do
            AutoFarmWeapon:SetOptions(getWeapon())
        end
    end)

    local DD9 = Farm.Toggle({Text = 'Auto Farm Level (Normal)', Enabled = Settings['Auto Farm'], Menu = {
        Description = function ()
            Main.Banner({Text = 'Auto Farm Level'})
        end}, Callback = function (vu)
        Settings['Auto Farm'] = vu
        while Settings['Auto Farm'] do task.wait()
            if game:GetService'Players'.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                CheckQuest() if StartClick then StartClick = false end
                repeat wait()
                    Tween(CFrame.new(posQuest))
                until (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5 or Settings['Auto Farm'] == false
                if (game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5 then wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                end
            elseif game:GetService'Players'.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                CheckQuest()
                if string.find(game:GetService'Players'.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                    if game:GetService("Workspace").Enemies:FindFirstChild(nameMob)
                    and game:GetService("Workspace").Enemies:FindFirstChild(nameMob):FindFirstChild'HumanoidRootPart'
                    and game:GetService("Workspace").Enemies:FindFirstChild(nameMob):FindFirstChild'Humanoid'
                    and game:GetService("Workspace").Enemies:FindFirstChild(nameMob).Humanoid.Health > 0
                    then
                        pcall(function ()
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                CheckQuest()
                                if v.Name == nameMob and v:FindFirstChild'HumanoidRootPart' and v:FindFirstChild'Humanoid' and v.Humanoid.Health > 0 then
                                    StartClick = true
                                    -- HealthMin = v.Humanoid.MaxHealth * Settings['HealthPersen'] / 100
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        bringName = v.Name
                                        magnetPosition = v.HumanoidRootPart.CFrame
                                        if Settings['Bring Mob'] and newMagnet then
                                            Tween(CFrame.new(newBring) * CFrame.new(0, 20, 0))
                                        else
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        end
                                        -- if v.Humanoid.Health <= HealthMin and Settings['GunMastery'] then
                                        --     _G.Status = 'Auto Farm Level / Gun Mastery'
                                        --     if StartClick then StartClick = false end
                                        --     Equip(Gun)
                                        --     game:GetService'Players'.LocalPlayer.Character[Gun].RemoteFunctionShoot:InvokeServer(v.HumanoidRootPart.Position, v.HumanoidRootPart)
                                        --     game:GetService'Players'.LocalPlayer.Character[Gun].RemoteEvent:FireServer(v.HumanoidRootPart.Position)
                                        --     Click()
                                        -- elseif v.Humanoid.Health <= HealthMin and Settings['FruitMastery'] then
                                        --     _G.Status = 'Auto Farm Level / Fruit Mastery'
                                        --     if StartClick then StartClick = false end
                                        --     UseFruit = true
                                        --     Equip(game:GetService'Players'.LocalPlayer.Data.DevilFruit.Value)
                                        --     if Settings['FruitMastery'] and game:GetService'Players'.LocalPlayer.Character ~= nil and game:GetService'Players'.LocalPlayer.Character.Parent ~= nil then
                                        --         if game:GetService'Players'.LocalPlayer.Character:FindFirstChild(game:GetService'Players'.LocalPlayer.Data.DevilFruit.Value) then
                                        --             if Settings['SkillZ'] then
                                        --                 game:GetService'VirtualInputManager':SendKeyEvent(true, "Z", false, game) wait(.1)
                                        --                 game:GetService'VirtualInputManager':SendKeyEvent(false, "Z", false, game)
                                        --             end
                                        --             if Settings['SkillX'] then
                                        --                 game:GetService'VirtualInputManager':SendKeyEvent(true, "X", false, game) wait(.1)
                                        --                 game:GetService'VirtualInputManager':SendKeyEvent(false, "X", false, game)
                                        --             end
                                        --             if Settings['SkillC'] then
                                        --                 game:GetService'VirtualInputManager':SendKeyEvent(true, "C", false, game) wait(.1)
                                        --                 game:GetService'VirtualInputManager':SendKeyEvent(false, "C", false, game)
                                        --             end
                                        --             if Settings['SkillV'] then
                                        --                 game:GetService'VirtualInputManager':SendKeyEvent(true, "V", false, game) wait(.1)
                                        --                 game:GetService'VirtualInputManager':SendKeyEvent(false, "V", false, game)
                                        --             end
                                        --             if Settings['SkillZ'] then
                                        --                 game:GetService'VirtualInputManager':SendKeyEvent(true, "Z", false, game) wait(.1)
                                        --                 game:GetService'VirtualInputManager':SendKeyEvent(false, "Z", false, game)
                                        --             end
                                        --         end
                                        --     end
                                        -- else
                                            -- if UseFruit then UseFruit = false end
                                            StartClick = true
                                            Equip(Settings['Farm Weapon'])
                                        -- end
                                    until v.Humanoid.Health < 0.1 or Settings['Auto Farm'] == false or not v.Parent or game:GetService'Players'.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not Alive()
                                    if StartClick then StartClick = false end
                                end
                            end
                        end)
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
            end
        end
        if Settings['Auto Farm'] == false then
            StopTween()
        end
    end})
end
coroutine.wrap(ASTROHUB)()
