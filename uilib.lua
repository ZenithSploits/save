local library = {}

local toggled = false
local currentTab = nil

function library:CreateWindow(text)
	local ZenHub = Instance.new("ScreenGui")
	local Top = Instance.new("Frame")
	local Main = Instance.new("Frame")
	local Tabs = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Title = Instance.new("TextLabel")
	local Close = Instance.new("TextButton")
	local Minimize = Instance.new("TextButton")
	local TabsMain = Instance.new("Frame")

	ZenHub.Name = "ZenHub"
	ZenHub.Parent = game.CoreGui
	ZenHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ZenHub.DisplayOrder = 100

	Top.Name = "Top"
	Top.Parent = ZenHub
	Top.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Top.BorderSizePixel = 0
	Top.Position = UDim2.new(0.190104187, 0, 0.240234375, 0)
	Top.Size = UDim2.new(0, 475, 0, 29)
	Top.Active = true
	Top.Draggable = true

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



	
	local TabLibrary = {}
	

	function TabLibrary:CreateTab(text)
		text = text or "New Tab"
		local Containers = Instance.new("Folder")
		local Container2 = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local TabButton = Instance.new("ImageButton")
		local TextLabel = Instance.new("TextLabel")

		Containers.Name = "Containers"
		Containers.Parent = TabsMain
		
		Container2.Name = text.." Container"
		Container2.Parent = Containers
		Container2.Active = true
		Container2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Container2.BackgroundTransparency = 1.000
		Container2.BorderSizePixel = 0
		Container2.Position = UDim2.new(-0.029442871, 0, -0.0336879268, 0)
		Container2.Size = UDim2.new(0, 287, 0, 228)
		Container2.Visible = false
		Container2.ScrollBarThickness = 9
		
		UIListLayout.Parent = Container2
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 2)
		
		TabButton.Name = text.."Button"
		TabButton.Parent = Tabs
		TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		TabButton.BackgroundTransparency = 1.000
		TabButton.Position = UDim2.new(-0.0127388537, 0, 0.0350877196, 0)
		TabButton.Size = UDim2.new(0, 153, 0, 32)
		TabButton.Image = "rbxassetid://2790389767"
		TabButton.ImageColor3 = Color3.fromRGB(35, 35, 35)
		TabButton.ScaleType = Enum.ScaleType.Slice
		TabButton.SliceCenter = Rect.new(8, 8, 248, 248)
		
		TextLabel.Parent = TabButton
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.485000014, 0, 0.424999952, 0)
		TextLabel.Size = UDim2.new(1, -5, 1, -5)
		TextLabel.Font = Enum.Font.GothamSemibold
		TextLabel.Text = text
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 14.000

		TabButton.MouseButton1Click:Connect(function()
			currentTab = Container2
			Container2.Visible = true
		end)
		
		local EpicLibrary = {}

		function EpicLibrary:CreateButton(text, Parent, callback)
			text = text or "New Button"
			callback = callback or function() end
			local Button = Instance.new("ImageButton")
			local TextLabel = Instance.new("TextLabel")
	
			Button.Name = "Button"
			Button.Parent = Parent
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
	
		function EpicLibrary:CreateToggle(text, Parent, callback)
			local actions = {}
			local enabled = false
	
			text = text or "New Toggle"
			callback = callback or function() end
	
			local Toggle = Instance.new("ImageButton")
			local TextLabel = Instance.new("TextLabel")
			local Check = Instance.new("ImageButton")
			local Frame = Instance.new("Frame")
	
			Toggle.Name = "Toggle"
			Toggle.Parent = Parent
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
	
			local function Fire()
				enabled = not enabled
				Check.ImageTransparency = enabled and 0 or 1
				pcall(callback, enabled)
			end
			
			function actions:Set(arg)
				Check.ImageTransparency = enabled and 0 or 1
				pcall(callback, enabled)
			end
			
			Toggle.MouseButton1Click:Connect(Fire)
		end
	
		function EpicLibrary:CreateSlider(text, Parent, minvalue, maxvalue, callback)
			local Slider = Instance.new("ImageLabel")
			local SliderText = Instance.new("TextLabel")
			local SliderButton = Instance.new("TextButton")
			local SliderInner = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
	
			text = text or "New Slider"
			minvalue = minvalue or 0
			maxvalue = maxvalue or 100
	
			callback = callback or function() end
	
			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")
			local Value;
	
			Slider.Name = "Slider"
			Slider.Parent = Parent
			Slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Slider.BackgroundTransparency = 1.000
			Slider.Position = UDim2.new(0, 0, 0.552631557, 0)
			Slider.Size = UDim2.new(0, 279, 0, 47)
			Slider.Image = "rbxassetid://3570695787"
			Slider.ImageColor3 = Color3.fromRGB(35, 35, 35)
			Slider.ScaleType = Enum.ScaleType.Slice
			Slider.SliceCenter = Rect.new(100, 100, 100, 100)
			Slider.SliceScale = 0.120
	
			SliderText.Name = "SliderText"
			SliderText.Parent = Slider
			SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.BackgroundTransparency = 1.000
			SliderText.Position = UDim2.new(0.0358422846, 0, 0, 0)
			SliderText.Size = UDim2.new(0, 96, 0, 22)
			SliderText.Font = Enum.Font.GothamSemibold
			SliderText.Text = text
			SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.TextSize = 14.000
			SliderText.TextXAlignment = Enum.TextXAlignment.Left
	
			SliderButton.Name = "SliderButton"
			SliderButton.Parent = Slider
			SliderButton.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
			SliderButton.BorderSizePixel = 0
			SliderButton.Position = UDim2.new(0.0537634417, 0, 0.46808514, 0)
			SliderButton.Size = UDim2.new(0, 249, 0, 15)
			SliderButton.AutoButtonColor = false
			SliderButton.Font = Enum.Font.SourceSans
			SliderButton.Text = ""
			SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			SliderButton.TextSize = 14.000
	
			SliderInner.Name = "SliderInner"
			SliderInner.Parent = SliderButton
			SliderInner.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			SliderInner.BorderSizePixel = 0
			SliderInner.Size = UDim2.new(0, 0, 0, 15)
	
			TextLabel.Parent = Slider
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.6021505, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 96, 0, 22)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.Text = "0"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 16.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Right
	
			SliderButton.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 249) * SliderInner.AbsoluteSize.X) + tonumber(minvalue)) or 0
				pcall(function()
					callback(Value)
				end)
				SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 249), 0, 15)
				moveconnection = mouse.Move:Connect(function()
					TextLabel.Text = Value
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 249) * SliderInner.AbsoluteSize.X) + tonumber(minvalue))
					pcall(function()
						callback(Value)
					end)
					SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 249), 0, 15)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 249) * SliderInner.AbsoluteSize.X) + tonumber(minvalue))
						pcall(function()
							callback(Value)
						end)
						SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 249), 0, 15)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
			
		end
		return EpicLibrary;
	end
	return TabLibrary;
end