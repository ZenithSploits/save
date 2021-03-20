local ZenUiLib = {}

ZenUiLib.flags = {}
ZenUiLib.flags.toggles = {}
ZenUiLib.flags.sliders = {}
ZenUiLib.functions = {}
ZenUiLib.currentTab = nil

local toggled = false

local inputService = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local RunService = game:GetService("RunService")

function ZenUiLib.functions:DestroyGUI()
	if game.CoreGui:FindFirstChild("ZenHub") then game.CoreGui.ZenHub:Destroy() end
end
ZenUiLib.functions:DestroyGUI() 
function ZenUiLib.functions:Tween(Object, TweenData, Data)
	if TweenData == "Default" then TweenData = {Time = 0.1, Style = "Linear", Direction = "InOut"} end
	ts:Create(Object, TweenInfo.new(TweenData.Time, Enum.EasingStyle[TweenData.Style], Enum.EasingDirection[TweenData.Direction]), Data):Play()
end

function ZenUiLib.functions:Drag(frame,hold)
    if not hold then hold = frame end
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    hold.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    inputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

function ZenUiLib.functions:ChangeSection(NewSection)
	if ZenUiLib.currentTab == NewSection then return end
	if ZenUiLib.currentTab == nil then
		ZenUiLib.currentTab = NewSection
		ZenUiLib.currentTab.Visible = true
		return		
	end
	ZenUiLib.currentTab.Visible = false
	ZenUiLib.currentTab = NewSection
	NewSection.Visible = true
end

function ZenUiLib:CreateWindow(text) 
    local ZenHub = Instance.new("ScreenGui")
    local Top = Instance.new("Frame")
    local Main = Instance.new("Frame")
    local Tabs = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local TabsMain = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Close = Instance.new("TextButton")
    local Minimize = Instance.new("TextButton")

    ZenHub.Name = "ZenHub"
    ZenHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ZenHub.DisplayOrder = 100
    
    Top.Name = "Top"
    Top.Parent = ZenHub
    Top.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0.190104187, 0, 0.240234375, 0)
    Top.Size = UDim2.new(0, 475, 0, 29)
    
    Main.Name = "Main"
    Main.Parent = Top
    Main.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.Position = UDim2.new(0.000630480237, 0, 0.969625533, 0)
    Main.Size = UDim2.new(0, 475, 0, 248)
    
    Tabs.Name = "Tabs"
    Tabs.Parent = Main
    Tabs.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0.0195778925, 0, 0.0375885516, 0)
    Tabs.Size = UDim2.new(0, 157, 0, 228)
    Tabs.Style = Enum.FrameStyle.RobloxRound
    
    UIListLayout.Parent = Tabs
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 1)
    
    TabsMain.Name = "TabsMain"
    TabsMain.Parent = Main
    TabsMain.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    TabsMain.BorderSizePixel = 0
    TabsMain.Position = UDim2.new(0.373262107, 0, 0.0375885516, 0)
    TabsMain.Size = UDim2.new(0, 287, 0, 228)
    TabsMain.Style = Enum.FrameStyle.RobloxRound
    
    Title.Name = "Title"
    Title.Parent = Top
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.29052633, 0, 0, 0)
    Title.Size = UDim2.new(0, 200, 0, 28)
    Title.Font = Enum.Font.GothamBold
    Title.Text = text
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14.000
    
    Close.Name = "Close"
    Close.Parent = Top
    Close.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.930526316, 0, 0, 0)
    Close.Size = UDim2.new(0, 33, 0, 28)
    Close.Font = Enum.Font.GothamBlack
    Close.Text = "X"
    Close.TextColor3 = Color3.fromRGB(166, 0, 0)
    Close.TextScaled = true
    Close.TextSize = 30.000
    Close.TextWrapped = true
    Close.TextYAlignment = Enum.TextYAlignment.Bottom
    
    Close.MouseButton1Click:Connect(function()
		ZenHub:Destroy()
	end)


    Minimize.Name = "Minimize"
    Minimize.Parent = Top
    Minimize.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    Minimize.BorderSizePixel = 0
    Minimize.Position = UDim2.new(0.861052632, 0, 0, 0)
    Minimize.Size = UDim2.new(0, 33, 0, 28)
    Minimize.Font = Enum.Font.JosefinSans
    Minimize.Text = "-"
    Minimize.TextColor3 = Color3.fromRGB(77, 77, 77)
    Minimize.TextSize = 30.000
	
	Minimize.MouseButton1Click:Connect(function()
		if toggled == false then
			local debounce = false
			if debounce == false then
				debounce = true
				Main:TweenSize(UDim2.new(0, 475,0, 0), "InOut", "Quad", 0.2)
				Minimize.Text = "+"
				toggled = true
				wait(0.2)
				debounce = false
			end
		else
			local debounce = false
			if debounce == false then
				debounce = true
				Main:TweenSize(UDim2.new(0, 475,0, 248), "InOut", "Linear", 0.2)
				Minimize.Text = "-"
				toggled = false
				wait(0.2)
				debounce = false
			end
		end	
	end)
    ZenUiLib.functions:Drag(Top, Title)
    local Sections = {}
    function Sections:CreateSection(SectionName)
        local Button = Instance.new("ImageButton")
        local TextLabel = Instance.new("TextLabel")
        local ScrollingFrame = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")

        Button.Name = "Button"
        Button.Parent = Tabs
        Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        Button.BackgroundTransparency = 1.000
        Button.Position = UDim2.new(-0.13694267, 0, 0.0350877196, 0)
        Button.Size = UDim2.new(0, 149, 0, 40)
        Button.Image = "rbxassetid://2790389767"
        Button.ImageColor3 = Color3.fromRGB(35, 35, 35)
        Button.ScaleType = Enum.ScaleType.Slice
        Button.SliceCenter = Rect.new(8, 8, 248, 248)
        
        TextLabel.Parent = Button
        TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0.5, 0, 0.425000012, 0)
        TextLabel.Size = UDim2.new(1, -5, 1, -5)
        TextLabel.Font = Enum.Font.GothamSemibold
        TextLabel.Text = "Button"
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 14.000
        
        ScrollingFrame.Parent = TabsMain
        ScrollingFrame.Active = true
        ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollingFrame.BackgroundTransparency = 1.000
        ScrollingFrame.BorderSizePixel = 0
        ScrollingFrame.Position = UDim2.new(-0.0120163765, 0, -0.0408766866, 0)
        ScrollingFrame.Size = UDim2.new(0, 281, 0, 226)
        ScrollingFrame.ScrollBarThickness = 9
        
        UIListLayout.Parent = ScrollingFrame
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 2)
        if ZenUiLib.currentTab == nil then
			ZenUiLib.functions:ChangeSection(ScrollingFrame)
		end
		Button.MouseButton1Click:Connect(function()
			ZenUiLib.functions:ChangeSection(ScrollingFrame)
		end)
        local ObjectTbl = {}
        function ObjectTbl:CreateButton(text, callback)
            text = text or "New Button"
            callback = callback or function() end

            local Button = Instance.new("ImageButton")
			local TextLabel = Instance.new("TextLabel")
	
			Button.Name = "Button"
			Button.Parent = ScrollingFrame
			Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Button.BackgroundTransparency = 1.000
			Button.Size = UDim2.new(0, 279, 0, 40)
			Button.Image = "rbxassetid://2790390993"
			Button.ImageColor3 = Color3.fromRGB(35, 35, 35)
			Button.ScaleType = Enum.ScaleType.Slice
			Button.SliceCenter = Rect.new(16, 16, 240, 240)
	
			TextLabel.Parent = Button
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextLabel.Selectable = true
			TextLabel.Size = UDim2.new(1, -5, 1, -5)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.Text = text
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
	
			Button.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
        end
        function ObjectTbl:CreateToggle(text, flag, func)
			text = text or "New Toggle"
            ZenUiLib.flags.toggles[flag] = false
			local isFunctionToggle = false
			if func then
				isFunctionToggle = true
			end

			local Toggle = Instance.new("ImageButton")
			local TextLabel = Instance.new("TextLabel")
			local Check = Instance.new("ImageButton")
			local Frame = Instance.new("Frame")
	
			Toggle.Name = "Toggle"
			Toggle.Parent = ScrollingFrame
			Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Toggle.BackgroundTransparency = 1.000
			Toggle.Selectable = true
			Toggle.Size = UDim2.new(0, 279, 0, 40)
			Toggle.Image = "rbxassetid://2790390993"
			Toggle.ImageColor3 = Color3.fromRGB(35, 35, 35)
			Toggle.ScaleType = Enum.ScaleType.Slice
			Toggle.SliceCenter = Rect.new(16, 16, 240, 240)
	
			TextLabel.Parent = Toggle
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextLabel.Size = UDim2.new(1, -5, 1, -5)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.Text = text
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
	
			Check.Name = "Check"
			Check.Parent = Toggle
			Check.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Check.BackgroundTransparency = 1.000
			Check.Position = UDim2.new(0.0500971377, 0, 0.157669321, 0)
			Check.Size = UDim2.new(0, 25, 0, 25)
			Check.ZIndex = 2
			Check.Image = "rbxassetid://3926305904"
			Check.ImageRectOffset = Vector2.new(644, 204)
			Check.ImageRectSize = Vector2.new(36, 36)
			Check.ImageTransparency = 1.000
	
			Frame.Parent = Toggle
			Frame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.037084654, 0, 0.100000001, 0)
			Frame.Size = UDim2.new(0, 31, 0, 31)

            local function togglefunc()
				ZenUiLib.flags.toggles[flag] = not ZenUiLib.flags.toggles[flag]
				if isFunctionToggle then func(ZenUiLib.flags.toggles[flag]) end
				
			end

			Toggle.MouseButton1Click:Connect(togglefunc)
			Check.MouseButton1Click:Connect(togglefunc)
            Frame.MouseButton1Click:Connect(togglefunc)
		end
        function ObjectTbl:CreateLabel(txt)
            local Label = Instance.new("ImageButton")
            local TextLabel = Instance.new("TextLabel")

            Label.Name = "Label"
            Label.Parent = ScrollingFrame
            Label.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            Label.BackgroundTransparency = 1.000
            Label.Selectable = false
            Label.Size = UDim2.new(0, 268, 0, 40)
            Label.AutoButtonColor = false
            Label.Image = "rbxassetid://2790389767"
            Label.ImageColor3 = Color3.fromRGB(35, 35, 35)
            Label.ScaleType = Enum.ScaleType.Slice
            Label.SliceCenter = Rect.new(8, 8, 248, 248)
            
            TextLabel.Parent = Label
            TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.BorderSizePixel = 0
            TextLabel.Position = UDim2.new(0.5, 0, 0.425000012, 0)
            TextLabel.Size = UDim2.new(1, -5, 1, -5)
            TextLabel.Font = Enum.Font.GothamSemibold
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.Text = txt or "New Text Label"
            TextLabel.TextSize = 14.000
        end
        function ObjectTbl:CreateSlider(SliderTxt, flag, min, max, precise, func)
            default = false
			local isFunc = false
			if func then     
				isFunc = true 
			end
			ZenUiLib.flags.sliders[flag] = min
            
            local Slider = Instance.new("TextButton")
            local SLIDERBotomLien = Instance.new("Frame")
            local SLIDERTopLien = Instance.new("Frame")
            local sliderback = Instance.new("Frame")
            local sliderfiller = Instance.new("Frame")
            local sliderval = Instance.new("TextLabel")

            Slider.Name = "Slider"
            Slider.Parent = game.StarterGui.ZenHub.Top.Main.TabsMain.ScrollingFrame
            Slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(0.166666672, 0, 0.122727275, 0)
            Slider.Size = UDim2.new(0, 267, 0, 30)
            Slider.AutoButtonColor = false
            Slider.Font = Enum.Font.GothamSemibold
            Slider.Text = SliderTxt or "New Slider"
            Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
            Slider.TextSize = 14.000
            Slider.TextXAlignment = Enum.TextXAlignment.Left
            
            SLIDERBotomLien.Name = "SLIDERBotomLien"
            SLIDERBotomLien.Parent = Slider
            SLIDERBotomLien.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            SLIDERBotomLien.BorderSizePixel = 0
            SLIDERBotomLien.Position = UDim2.new(0, 0, 0.966666639, 0)
            SLIDERBotomLien.Size = UDim2.new(1, 0, 0, 1)
            
            SLIDERTopLien.Name = "SLIDERTopLien"
            SLIDERTopLien.Parent = Slider
            SLIDERTopLien.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            SLIDERTopLien.BorderSizePixel = 0
            SLIDERTopLien.Position = UDim2.new(0, 0, 1.49011612e-08, 0)
            SLIDERTopLien.Size = UDim2.new(1, 0, 0, 1)
            
            sliderback.Name = "sliderback"
            sliderback.Parent = Slider
            sliderback.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
            sliderback.BorderSizePixel = 0
            sliderback.Position = UDim2.new(0.606741548, 0, 0.166666672, 0)
            sliderback.Size = UDim2.new(0, 100, 0, 20)
            
            sliderfiller.Name = "sliderfiller"
            sliderfiller.Parent = sliderback
            sliderfiller.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            sliderfiller.BorderSizePixel = 0
            sliderfiller.Size = UDim2.new(0.0113180205, 0, 1, 0)
            
            sliderval.Name = "sliderval"
            sliderval.Parent = sliderback
            sliderval.AnchorPoint = Vector2.new(0.5, 0)
            sliderval.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderval.BackgroundTransparency = 1.000
            sliderval.BorderSizePixel = 0
            sliderval.Position = UDim2.new(0.5, 0, 0, 0)
            sliderval.Size = UDim2.new(0, 0, 0, 20)
            sliderval.Font = Enum.Font.GothamSemibold
            sliderval.Text = "18 / 200"
            sliderval.TextColor3 = Color3.fromRGB(255, 255, 255)
            sliderval.TextSize = 14.000

            local Connection;
			inputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if(Connection) then
						Connection:Disconnect();
						Connection = nil;
					end;
				end;
			end);
			Slider.MouseButton1Down:Connect(function()
				if(Connection) then
					Connection:Disconnect();
				end;
				Connection = RunService.Heartbeat:Connect(function()
					local mouse = inputService:GetMouseLocation();
					local percent = math.clamp((mouse.X - Slider.AbsolutePosition.X) / (Slider.AbsoluteSize.X), 0, 1);
					local Value = min + (max - min) * percent;
					if not precise then
						Value = math.floor(Value);
					end;
					Value = tonumber(string.format("%.2f", Value));
					ZenUiLib.functions:Tween(sliderfiller, "Default", {Size = UDim2.new(percent, 0, 1, 0)})
					sliderval.Text = tostring(Value) .. " / " .. max;
					ZenUiLib.flags.sliders[flag] = Value;
					if isFunc then func(Value) end
				end);
			end);
        end
		return ObjectTbl
    end
    return Sections
end