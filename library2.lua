-- Services
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")
local CG = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")
local TCS = game:GetService("TextChatService")
local BCC = TCS.BubbleChatConfiguration
local Players = game:GetService("Players")

-- Vars
local LP = Players.LocalPlayer
local MP = LP:GetMouse()
local VP = workspace.CurrentCamera.ViewportSize
local TI = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}

function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, Callback)
	local tween = TS:Create(object, TI, goal)
	tween.Completed:Connect(Callback or function() end)
	tween:Play()
end

do
	local UI = {}
	
	-- BubbleChatConfiguration
	BCC["TextColor3"] = Color3.fromRGB(255, 255, 255);
	BCC["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	BCC["LocalPlayerStudsOffset"] = Vector3.new(0, 0.20, 0);
	BCC["AdorneeName"] = "Head";
	BCC["BubblesSpacing"] = 3;
	BCC["TextSize"] = 15;
	BCC["MaxBubbles"] = 5;
	BCC["TailVisible"] = true;
	wait(0.5)
	BCC["TailVisible"] = false;


	-- UIGradient
	UI["UIGradient"] = Instance.new("UIGradient", BCC)
	UI["UIGradient"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(30, 30, 30)),ColorSequenceKeypoint.new(0.495, Color3.fromRGB(111, 91, 117)),ColorSequenceKeypoint.new(0.505, Color3.fromRGB(111, 91, 117)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(30, 30, 30))};
	UI["UIGradient"]["Enabled"] = true;
	UI["UIGradient"]["Rotation"] = -90;


	-- UICorner
	UI["UICorner"] = Instance.new("UICorner", BCC)
	BCC["UICorner"]["CornerRadius"] = UDim.new(0, 5);


	-- UIPadding
	UI["UIPadding"] = Instance.new("UIPadding", BCC)
	BCC["UIPadding"]["PaddingTop"] = UDim.new(0, 3);
	BCC["UIPadding"]["PaddingBottom"] = UDim.new(0, 3);
	BCC["UIPadding"]["PaddingLeft"] = UDim.new(0, 3);
	BCC["UIPadding"]["PaddingRight"] = UDim.new(0, 3);
end

function Library:new(options)
	options = Library:validate({
		NameUp = "TitleUp",
		NameDown = "TitleDown"
	}, options or {})
	
	local nation = {
		CurrentTab = nil
	}
	
	
	-- Main Frame
	do
		-- StarterGui.NationLibrary
		nation["1"] = Instance.new("ScreenGui", RS:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or CG);
		nation["1"]["Name"] = [[NationLibrary]];
		nation["1"]["IgnoreGuiInset"] = true;


		-- StarterGui.NationLibrary.Main
		nation["2"] = Instance.new("Frame", nation["1"]);
		nation["2"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
		nation["2"]["AnchorPoint"] = Vector2.new(0, 0);
		nation["2"]["Size"] = UDim2.new(0, 400, 0, 600);
		nation["2"]["Position"] = UDim2.fromOffset((VP.X/2) - (nation["2"].Size.X.Offset / 2), (VP.Y/2) - (nation["2"].Size.Y.Offset / 2));
		nation["2"]["Name"] = [[Main]];


		-- StarterGui.NationLibrary.Main.UICorner
		nation["3"] = Instance.new("UICorner", nation["2"]);
		nation["3"]["CornerRadius"] = UDim.new(0, 6);


		-- StarterGui.NationLibrary.Main.UIStroke
		nation["c"] = Instance.new("UIStroke", nation["2"]);
		nation["c"]["Color"] = Color3.fromRGB(112, 92, 118);


		-- StarterGui.NationLibrary.Main.DropShadowHolder
		nation["4"] = Instance.new("Frame", nation["2"]);
		nation["4"]["ZIndex"] = 0;
		nation["4"]["BorderSizePixel"] = 0;
		nation["4"]["Size"] = UDim2.new(1, 0, 1, 0);
		nation["4"]["Name"] = [[DropShadowHolder]];
		nation["4"]["BackgroundTransparency"] = 1;


		-- StarterGui.NationLibrary.Main.DropShadowHolder.DropShadow
		nation["5"] = Instance.new("ImageLabel", nation["4"]);
		nation["5"]["ZIndex"] = 0;
		nation["5"]["BorderSizePixel"] = 0;
		nation["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		nation["5"]["ScaleType"] = Enum.ScaleType.Slice;
		nation["5"]["ImageTransparency"] = 0.5;
		nation["5"]["ImageColor3"] = Color3.fromRGB(134, 85, 137);
		nation["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		nation["5"]["Image"] = [[rbxassetid://6014261993]];
		nation["5"]["Size"] = UDim2.new(1, 47, 1, 47);
		nation["5"]["BackgroundTransparency"] = 1;
		nation["5"]["Name"] = [[DropShadow]];
		nation["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


		-- StarterGui.NationLibrary.Main.TopBar
		nation["6"] = Instance.new("Frame", nation["2"]);
		nation["6"]["BorderSizePixel"] = 0;
		nation["6"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		nation["6"]["Size"] = UDim2.new(1, 0, 0, 20);
		nation["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["6"]["Name"] = [[TopBar]];


		-- StarterGui.NationLibrary.Main.TopBar.UICorner
		nation["7"] = Instance.new("UICorner", nation["6"]);
		nation["7"]["CornerRadius"] = UDim.new(0, 6);


		-- StarterGui.NationLibrary.Main.TopBar.Extension
		nation["8"] = Instance.new("Frame", nation["6"]);
		nation["8"]["BorderSizePixel"] = 0;
		nation["8"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		nation["8"]["AnchorPoint"] = Vector2.new(0, 1);
		nation["8"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		nation["8"]["Position"] = UDim2.new(0, 0, 1, 0);
		nation["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["8"]["Name"] = [[Extension]];


		-- StarterGui.NationLibrary.Main.TopBar.Title
		nation["9"] = Instance.new("TextLabel", nation["6"]);
		nation["9"]["TextWrapped"] = true;
		nation["9"]["BorderSizePixel"] = 0;
		nation["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		nation["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		nation["9"]["TextSize"] = 12;
		nation["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		nation["9"]["TextColor3"] = Color3.fromRGB(112, 92, 118);
		nation["9"]["BackgroundTransparency"] = 1;
		nation["9"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		nation["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["9"]["Text"] = options["NameUp"];
		nation["9"]["Name"] = [[Title]];


		-- StarterGui.NationLibrary.Main.TopBar.Title.UIPadding
		nation["a"] = Instance.new("UIPadding", nation["9"]);
		nation["a"]["PaddingLeft"] = UDim.new(0, 8);
		nation["a"]["PaddingBottom"] = UDim.new(0, 1);


		-- StarterGui.NationLibrary.Main.TopBar.Line
		nation["b"] = Instance.new("Frame", nation["6"]);
		nation["b"]["BorderSizePixel"] = 0;
		nation["b"]["BackgroundColor3"] = Color3.fromRGB(112, 92, 118);
		nation["b"]["AnchorPoint"] = Vector2.new(0, 1);
		nation["b"]["Size"] = UDim2.new(1, 0, 0, 1);
		nation["b"]["Position"] = UDim2.new(0, 0, 1, 0);
		nation["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["b"]["Name"] = [[Line]];


		-- StarterGui.NationLibrary.Main.BottomBar
		nation["4c"] = Instance.new("Frame", nation["2"]);
		nation["4c"]["BorderSizePixel"] = 0;
		nation["4c"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		nation["4c"]["AnchorPoint"] = Vector2.new(0, 1);
		nation["4c"]["Size"] = UDim2.new(1, 0, 0, 20);
		nation["4c"]["Position"] = UDim2.new(0, 0, 1, 0);
		nation["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["4c"]["Name"] = [[BottomBar]];


		-- StarterGui.NationLibrary.Main.BottomBar.UICorner
		nation["4d"] = Instance.new("UICorner", nation["4c"]);
		nation["4d"]["CornerRadius"] = UDim.new(0, 6);


		-- StarterGui.NationLibrary.Main.BottomBar.Extension
		nation["4e"] = Instance.new("Frame", nation["4c"]);
		nation["4e"]["BorderSizePixel"] = 0;
		nation["4e"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		nation["4e"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		nation["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["4e"]["Name"] = [[Extension]];


		-- StarterGui.NationLibrary.Main.BottomBar.Title
		nation["4f"] = Instance.new("TextLabel", nation["4c"]);
		nation["4f"]["TextWrapped"] = true;
		nation["4f"]["BorderSizePixel"] = 0;
		nation["4f"]["TextXAlignment"] = Enum.TextXAlignment.Right;
		nation["4f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		nation["4f"]["TextSize"] = 12;
		nation["4f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		nation["4f"]["TextColor3"] = Color3.fromRGB(112, 92, 118);
		nation["4f"]["BackgroundTransparency"] = 1;
		nation["4f"]["AnchorPoint"] = Vector2.new(1, 0);
		nation["4f"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		nation["4f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["4f"]["Text"] = options["NameDown"];
		nation["4f"]["Name"] = [[Title]];
		nation["4f"]["Position"] = UDim2.new(1, 0, 0, 0);


		-- StarterGui.NationLibrary.Main.BottomBar.Title.UIPadding
		nation["50"] = Instance.new("UIPadding", nation["4f"]);
		nation["50"]["PaddingTop"] = UDim.new(0, 1);
		nation["50"]["PaddingRight"] = UDim.new(0, 8);


		-- StarterGui.NationLibrary.Main.BottomBar.Line
		nation["51"] = Instance.new("Frame", nation["4c"]);
		nation["51"]["BorderSizePixel"] = 0;
		nation["51"]["BackgroundColor3"] = Color3.fromRGB(112, 92, 118);
		nation["51"]["Size"] = UDim2.new(1, 0, 0, 1);
		nation["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["51"]["Name"] = [[Line]];
		
		
		-- StarterGui.NationLibrary.Main.ContentContainer
		nation["d"] = Instance.new("Frame", nation["2"]);
		nation["d"]["BorderSizePixel"] = 0;
		nation["d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		nation["d"]["AnchorPoint"] = Vector2.new(0, 1);
		nation["d"]["Size"] = UDim2.new(1, -10, 1, -70);
		nation["d"]["Position"] = UDim2.new(0, 5, 1, -25);
		nation["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["d"]["Name"] = [[ContentContainer]];


		-- StarterGui.NationLibrary.Main.ContentContainer.Fade
		nation["e"] = Instance.new("Frame", nation["d"]);
		nation["e"]["Visible"] = false;
		nation["e"]["ZIndex"] = 10;
		nation["e"]["BorderSizePixel"] = 0;
		nation["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		nation["e"]["Size"] = UDim2.new(1, 0, 0, 20);
		nation["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["e"]["Name"] = [[Fade]];


		-- StarterGui.NationLibrary.Main.ContentContainer.Fade.UIGradient
		nation["f"] = Instance.new("UIGradient", nation["e"]);
		nation["f"]["Rotation"] = 90;
		nation["f"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(0.341, 0.244),NumberSequenceKeypoint.new(1.000, 1)};
		nation["f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(41, 41, 41)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(41, 41, 41))};
	end
	
	-- Navigation
	do
		-- StarterGui.NationLibrary.Main.TabNavigation
		nation["52"] = Instance.new("Frame", nation["2"]);
		nation["52"]["BorderSizePixel"] = 0;
		nation["52"]["BackgroundColor3"] = Color3.fromRGB(52, 42, 55);
		nation["52"]["Size"] = UDim2.new(1, 0, 0, 20);
		nation["52"]["Position"] = UDim2.new(0, 0, 0, 20);
		nation["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["52"]["Name"] = [[TabNavigation]];


		-- StarterGui.NationLibrary.Main.TabNavigation.ButtonHolder
		nation["53"] = Instance.new("Frame", nation["52"]);
		nation["53"]["BorderSizePixel"] = 0;
		nation["53"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		nation["53"]["Size"] = UDim2.new(1, 0, 1, 0);
		nation["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		nation["53"]["Name"] = [[ButtonHolder]];
		nation["53"]["BackgroundTransparency"] = 1;


		-- StarterGui.NationLibrary.Main.TabNavigation.ButtonHolder.UIPadding
		nation["54"] = Instance.new("UIPadding", nation["53"]);
		nation["54"]["PaddingRight"] = UDim.new(0, 8);
		nation["54"]["PaddingLeft"] = UDim.new(0, 8);


		-- StarterGui.NationLibrary.Main.TabNavigation.ButtonHolder.UIListLayout
		nation["55"] = Instance.new("UIListLayout", nation["53"]);
		nation["55"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		nation["55"]["Padding"] = UDim.new(0, 10);
		nation["55"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		nation["55"]["FillDirection"] = Enum.FillDirection.Horizontal;
	end
	
	function nation:Tab(options)
		options = Library:validate({
			Name = "Preview Tab"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		--Render
		do
			-- StarterGui.NationLibrary.Main.TabNavigation.ButtonHolder.Inactive
			Tab["58"] = Instance.new("TextLabel", nation["53"]);
			Tab["58"]["TextWrapped"] = true;
			Tab["58"]["BorderSizePixel"] = 0;
			Tab["58"]["BackgroundColor3"] = Color3.fromRGB(78, 60, 82);
			Tab["58"]["TextSize"] = 12;
			Tab["58"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["58"]["TextColor3"] = Color3.fromRGB(150, 150, 150);
			Tab["58"]["Size"] = UDim2.new(0.3, 0, 1, 0);
			Tab["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["58"]["Text"] = options["Name"];
			Tab["58"]["Name"] = [[Inactive]];


			-- StarterGui.NationLibrary.Main.TabNavigation.ButtonHolder.Inactive.UIStroke
			Tab["59"] = Instance.new("UIStroke", Tab["58"]);
			Tab["59"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
			Tab["59"]["Color"] = Color3.fromRGB(112, 92, 118);
			
			
			-- StarterGui.NationLibrary.Main.ContentContainer.MainTab
			Tab["10"] = Instance.new("ScrollingFrame", nation["d"]);
			Tab["10"]["BorderSizePixel"] = 0;
			Tab["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["10"]["Name"] = [[MainTab]];
			Tab["10"]["Selectable"] = false;
			Tab["10"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["10"]["ScrollBarThickness"] = 0;
			Tab["10"]["BackgroundTransparency"] = 1;
			Tab["10"]["Visible"] = false;
			
			
			-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.UIListLayout
			Tab["1d"] = Instance.new("UIListLayout", Tab["10"]);
			Tab["1d"]["Padding"] = UDim.new(0, 10);
			Tab["1d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			
			
			-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.UIPadding
			Tab["17"] = Instance.new("UIPadding", Tab["10"]);
			Tab["17"]["PaddingTop"] = UDim.new(0, 1);
			Tab["17"]["PaddingRight"] = UDim.new(0, 1);
			Tab["17"]["PaddingLeft"] = UDim.new(0, 1);
			Tab["17"]["PaddingBottom"] = UDim.new(0, 1);
		end
		
		--Methods
		function Tab:Activate()
			if not Tab.Active then
				if nation.CurrentTab  ~= nil then
					nation.CurrentTab:Deactivate()
				end
				
				Tab.Active = true
				Library:tween(Tab["58"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Tab["58"], {BackgroundColor3 = Color3.fromRGB(108, 69, 111)})
				Tab["10"].Visible = true
				
				nation.CurrentTab = Tab
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Library:tween(Tab["58"], {TextColor3 = Color3.fromRGB(150, 150, 150)})
				Library:tween(Tab["58"], {BackgroundColor3 = Color3.fromRGB(78, 60, 82)})
				Tab["10"].Visible = false
			end
		end
		
		-- Logic
		do
			Tab["58"].MouseEnter:Connect(function()
				Tab.Hover = true
				if not Tab.Active then
					Library:tween(Tab["58"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab["58"].MouseLeave:Connect(function()
				Tab.Hover = false
				if not Tab.Active then
					Library:tween(Tab["58"], {TextColor3 = Color3.fromRGB(150, 150, 150)})
				end
			end)

			UIS.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)

			if nation.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		function Tab:Button(options)
			options = Library:validate({
				Name = "Preview Button",
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do
				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Button
				Button["11"] = Instance.new("Frame", Tab["10"]);
				Button["11"]["BorderSizePixel"] = 0;
				Button["11"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
				Button["11"]["Size"] = UDim2.new(1, 0, 0, 20);
				Button["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["11"]["Name"] = [[Button]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Button.UICorner
				Button["12"] = Instance.new("UICorner", Button["11"]);
				Button["12"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Button.Title
				Button["13"] = Instance.new("TextLabel", Button["11"]);
				Button["13"]["BorderSizePixel"] = 0;
				Button["13"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["13"]["TextSize"] = 12;
				Button["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["13"]["BackgroundTransparency"] = 1;
				Button["13"]["Size"] = UDim2.new(1, -20, 1, 0);
				Button["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["13"]["Text"] = options["Name"];
				Button["13"]["Name"] = [[Title]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Button.UIPadding
				Button["14"] = Instance.new("UIPadding", Button["11"]);
				Button["14"]["PaddingTop"] = UDim.new(0, 3);
				Button["14"]["PaddingRight"] = UDim.new(0, 5);
				Button["14"]["PaddingLeft"] = UDim.new(0, 5);
				Button["14"]["PaddingBottom"] = UDim.new(0, 3);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Button.Icon
				Button["15"] = Instance.new("ImageLabel", Button["11"]);
				Button["15"]["BorderSizePixel"] = 0;
				Button["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["15"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["15"]["Image"] = [[rbxassetid://89826053765811]];
				Button["15"]["Size"] = UDim2.new(0, 14, 0, 14);
				Button["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["15"]["BackgroundTransparency"] = 1;
				Button["15"]["Name"] = [[Icon]];
				Button["15"]["Position"] = UDim2.new(1, 0, 0, 0);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Button.UIStroke
				Button["16"] = Instance.new("UIStroke", Button["11"]);
				Button["16"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Button["16"]["Color"] = Color3.fromRGB(112, 92, 118);
			end
			
			-- Methods
			function Button:SetText(text)
				Button["13"].Text = text
				options.Name = text
			end
			
			function Button:SetCallback(fn)
				options.Callback = fn
			end
			
			-- Logic
			do
				Button["11"].MouseEnter:Connect(function()
					Button.Hover = true
					
					Library:tween(Button["16"], {Color = Color3.fromRGB(78, 60, 82)})
				end)
				
				Button["11"].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Library:tween(Button["16"], {Color = Color3.fromRGB(112, 92, 118)})
					end
				end)
				
				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["11"], {BackgroundColor3 = Color3.fromRGB(90, 70, 95)})
						Library:tween(Button["16"], {Color = Color3.fromRGB(200, 200, 200)})
						options.Callback()
					end
				end)
				
				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						if Button.Hover then
							Library:tween(Button["11"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
							Library:tween(Button["16"], {Color = Color3.fromRGB(78, 60, 82)})
						else
							Library:tween(Button["11"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
							Library:tween(Button["16"], {Color = Color3.fromRGB(112, 92, 118)})
						end
					end
				end)
			end
			
			return Button
		end
		
		function Tab:Label(options)
			options = Library:validate({
				Text = "Preview Label"
			}, options or {})
			
			local Label = {}
			
			-- Render
			do
				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Label
				Label["18"] = Instance.new("Frame", Tab["10"]);
				Label["18"]["BorderSizePixel"] = 0;
				Label["18"]["BackgroundColor3"] = Color3.fromRGB(43, 37, 44);
				Label["18"]["Size"] = UDim2.new(1, 0, 0, 20);
				Label["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["18"]["Name"] = [[Label]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Label.UICorner
				Label["19"] = Instance.new("UICorner", Label["18"]);
				Label["19"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Label.Title
				Label["1a"] = Instance.new("TextLabel", Label["18"]);
				Label["1a"]["BorderSizePixel"] = 0;
				Label["1a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Label["1a"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				Label["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["1a"]["TextSize"] = 12;
				Label["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Label["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["1a"]["BackgroundTransparency"] = 1;
				Label["1a"]["Size"] = UDim2.new(1, 0, 1, 0);
				Label["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["1a"]["Name"] = [[Title]];
				Label["1a"]["Text"] = options["Text"];
				Label["1a"]["TextWrapped"] = true;


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Label.UIPadding
				Label["1b"] = Instance.new("UIPadding", Label["18"]);
				Label["1b"]["PaddingTop"] = UDim.new(0, 3);
				Label["1b"]["PaddingRight"] = UDim.new(0, 5);
				Label["1b"]["PaddingLeft"] = UDim.new(0, 5);
				Label["1b"]["PaddingBottom"] = UDim.new(0, 3);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Label.UIStroke
				Label["1c"] = Instance.new("UIStroke", Label["18"]);
				Label["1c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Label["1c"]["Color"] = Color3.fromRGB(175, 144, 185);
			end
			
			
			-- Methods
			function Label:SetText(text)
				options.Text = text
				Label:_update()
			end
			
			function Label:_update()
				Label["1a"].Text = options.Text
				
				Label["1a"].Size = UDim2.new(Label["1a"].Size.X.Scale, Label["1a"].Size.X.Offset, 0, math.huge)
				Label["1a"].Size = UDim2.new(Label["1a"].Size.X.Scale, Label["1a"].Size.X.Offset, 0, Label["1a"].TextBounds.Y)
				Library:tween(Label["18"], {Size = UDim2.new(Label["18"].Size.X.Scale, Label["18"].Size.X.Offset, 0, Label["1a"].TextBounds.Y + 6)})
			end
			
			
			Label:_update()
			return Label
		end
		
		function Tab:Toggle(options)
			options = Library:validate({
				Name = "Preview Toggle",
				Callback = function()
				end
			}, options or {})
			
			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			
			-- Render
			do
				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.ToggleInactive
				Toggle["43"] = Instance.new("Frame", Tab["10"]);
				Toggle["43"]["BorderSizePixel"] = 0;
				Toggle["43"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
				Toggle["43"]["Size"] = UDim2.new(1, 0, 0, 20);
				Toggle["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["43"]["Name"] = [[ToggleInactive]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.ToggleInactive.UICorner
				Toggle["44"] = Instance.new("UICorner", Toggle["43"]);
				Toggle["44"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.ToggleInactive.Title
				Toggle["45"] = Instance.new("TextLabel", Toggle["43"]);
				Toggle["45"]["BorderSizePixel"] = 0;
				Toggle["45"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["45"]["TextSize"] = 12;
				Toggle["45"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["45"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["45"]["BackgroundTransparency"] = 1;
				Toggle["45"]["AnchorPoint"] = Vector2.new(1, 0);
				Toggle["45"]["Size"] = UDim2.new(1, -20, 1, 0);
				Toggle["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["45"]["Text"] = options["Name"];
				Toggle["45"]["Name"] = [[Title]];
				Toggle["45"]["Position"] = UDim2.new(1, 0, 0, 0);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.ToggleInactive.UIPadding
				Toggle["46"] = Instance.new("UIPadding", Toggle["43"]);
				Toggle["46"]["PaddingTop"] = UDim.new(0, 3);
				Toggle["46"]["PaddingRight"] = UDim.new(0, 5);
				Toggle["46"]["PaddingLeft"] = UDim.new(0, 5);
				Toggle["46"]["PaddingBottom"] = UDim.new(0, 3);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.ToggleInactive.CheckMarkHolder
				Toggle["47"] = Instance.new("Frame", Toggle["43"]);
				Toggle["47"]["BorderSizePixel"] = 0;
				Toggle["47"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
				Toggle["47"]["Size"] = UDim2.new(0, 14, 0, 14);
				Toggle["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["47"]["Name"] = [[CheckMarkHolder]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.ToggleInactive.CheckMarkHolder.UICorner
				Toggle["48"] = Instance.new("UICorner", Toggle["47"]);
				Toggle["48"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.ToggleInactive.CheckMarkHolder.CheckMark
				Toggle["49"] = Instance.new("Frame", Toggle["47"]);
				Toggle["49"]["BorderSizePixel"] = 0;
				Toggle["49"]["BackgroundColor3"] = Color3.fromRGB(171, 0, 255);
				Toggle["49"]["Size"] = UDim2.new(1, 0, 1, 0);
				Toggle["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["49"]["Name"] = [[CheckMark]];
				Toggle["49"]["BackgroundTransparency"] = 1;


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.ToggleInactive.CheckMarkHolder.CheckMark.UICorner
				Toggle["4a"] = Instance.new("UICorner", Toggle["49"]);
				Toggle["4a"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.ToggleInactive.UIStroke
				Toggle["4b"] = Instance.new("UIStroke", Toggle["43"]);
				Toggle["4b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Toggle["4b"]["Color"] = Color3.fromRGB(112, 92, 118);
			end
			
			-- Methods
			do
				function Toggle:Toggle(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = b
					end
					
					if Toggle.State then
						Library:tween(Toggle["49"], {BackgroundColor3 = Color3.fromRGB(170, 0, 255)})
						Library:tween(Toggle["49"], {BackgroundTransparency = 0})
					else
						Library:tween(Toggle["49"], {BackgroundColor3 = Color3.fromRGB(31, 31, 31)})
						Library:tween(Toggle["49"], {BackgroundTransparency = 1})
					end


					options.Callback(Toggle.State)
				end
			end
			
			-- Logic
			do
				Toggle["43"].MouseEnter:Connect(function()
					Toggle.Hover = true

					Library:tween(Toggle["4b"], {Color = Color3.fromRGB(78, 60, 82)})
				end)

				Toggle["43"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Library:tween(Toggle["4b"], {Color = Color3.fromRGB(112, 92, 118)})
					end
				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Library:tween(Toggle["43"], {BackgroundColor3 = Color3.fromRGB(90, 70, 95)})
						Library:tween(Toggle["4b"], {Color = Color3.fromRGB(200, 200, 200)})
						Toggle:Toggle()
					end
				end)

				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false
						if Toggle.Hover then
							Library:tween(Toggle["43"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
							Library:tween(Toggle["4b"], {Color = Color3.fromRGB(78, 60, 82)})
						else
							Library:tween(Toggle["43"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
							Library:tween(Toggle["4b"], {Color = Color3.fromRGB(112, 92, 118)})
						end
					end
				end)
			end
			
			return Toggle
		end
		
		function Tab:Slider(options)
			options = Library:validate({
				Name = "Preview Slider",
				Min = 0,
				Max = 100,
				Default = 50,
				Callback = function(v)
					print(v)
				end
			}, options or {})

			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil,
				Options = options
			}
			
			-- Render
			do
				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider
				Slider["1e"] = Instance.new("Frame", Tab["10"]);
				Slider["1e"]["BorderSizePixel"] = 0;
				Slider["1e"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
				Slider["1e"]["Size"] = UDim2.new(1, 0, 0, 30);
				Slider["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["1e"]["Name"] = [[Slider]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider.UICorner
				Slider["1f"] = Instance.new("UICorner", Slider["1e"]);
				Slider["1f"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider.Title
				Slider["20"] = Instance.new("TextLabel", Slider["1e"]);
				Slider["20"]["BorderSizePixel"] = 0;
				Slider["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["20"]["TextSize"] = 12;
				Slider["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["20"]["BackgroundTransparency"] = 1;
				Slider["20"]["Size"] = UDim2.new(1, -24, 1, -10);
				Slider["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["20"]["Text"] = options["Name"];
				Slider["20"]["Name"] = [[Title]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider.UIPadding
				Slider["21"] = Instance.new("UIPadding", Slider["1e"]);
				Slider["21"]["PaddingTop"] = UDim.new(0, 3);
				Slider["21"]["PaddingRight"] = UDim.new(0, 5);
				Slider["21"]["PaddingLeft"] = UDim.new(0, 5);
				Slider["21"]["PaddingBottom"] = UDim.new(0, 3);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider.Value
				Slider["22"] = Instance.new("TextLabel", Slider["1e"]);
				Slider["22"]["BorderSizePixel"] = 0;
				Slider["22"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Slider["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["22"]["TextSize"] = 12;
				Slider["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["22"]["BackgroundTransparency"] = 1;
				Slider["22"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["22"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["22"]["Text"] = tostring(options["Default"]);
				Slider["22"]["Name"] = [[Value]];
				Slider["22"]["Position"] = UDim2.new(1, 0, 0, 0);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider.SliderBack
				Slider["23"] = Instance.new("Frame", Slider["1e"]);
				Slider["23"]["BorderSizePixel"] = 0;
				Slider["23"]["BackgroundColor3"] = Color3.fromRGB(13, 13, 13);
				Slider["23"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["23"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["23"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["23"]["Name"] = [[SliderBack]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider.SliderBack.UICorner
				Slider["24"] = Instance.new("UICorner", Slider["23"]);
				Slider["24"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider.SliderBack.UIStroke
				Slider["25"] = Instance.new("UIStroke", Slider["23"]);
				Slider["25"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Slider["25"]["Color"] = Color3.fromRGB(71, 58, 75);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider.SliderBack.Draggable
				Slider["26"] = Instance.new("Frame", Slider["23"]);
				Slider["26"]["BorderSizePixel"] = 0;
				Slider["26"]["BackgroundColor3"] = Color3.fromRGB(171, 0, 255);
				Slider["26"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["26"]["Name"] = [[Draggable]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider.SliderBack.Draggable.UICorner
				Slider["27"] = Instance.new("UICorner", Slider["26"]);
				Slider["27"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Slider.UIStroke
				Slider["28"] = Instance.new("UIStroke", Slider["1e"]);
				Slider["28"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Slider["28"]["Color"] = Color3.fromRGB(112, 92, 118);
			end
			
			-- Methods
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((MP.X - Slider["1e"].AbsolutePosition.X) / (Slider["1e"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.Max - options.Min) * percentage) + options.Min)
					
					Slider["22"].Text = tostring(value)
					Slider["26"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["22"].Text = tostring(v)
					Slider["26"].Size = UDim2.fromScale(((v - options.Min) / (options.Max - options.Min)), 1)
				end
				options.Callback(Slider:GetValue())
			end
			
			function Slider:GetValue()
				return tonumber(Slider["22"].Text)
			end
			
			-- Logic
			do
				Slider["1e"].MouseEnter:Connect(function()
					Slider.Hover = true

					Library:tween(Slider["28"], {Color = Color3.fromRGB(78, 60, 82)})
					Library:tween(Slider["25"], {Color = Color3.fromRGB(78, 60, 82)})
					Library:tween(Slider["26"], {BackgroundColor3 = Color3.fromRGB(78, 60, 82)})
				end)

				Slider["1e"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Library:tween(Slider["28"], {Color = Color3.fromRGB(112, 92, 118)})
						Library:tween(Slider["25"], {Color = Color3.fromRGB(112, 92, 118)})
						Library:tween(Slider["26"], {BackgroundColor3 = Color3.fromRGB(112, 92, 118)})
					end
				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["1e"], {BackgroundColor3 = Color3.fromRGB(90, 70, 95)})
						Library:tween(Slider["28"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["25"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["26"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})
						
						if not Slider.Connection then
							Slider.Connection = RS.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false
						if Slider.Hover then
							Library:tween(Slider["1e"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
							Library:tween(Slider["28"], {Color = Color3.fromRGB(78, 60, 82)})
							Library:tween(Slider["25"], {Color = Color3.fromRGB(78, 60, 82)})
							Library:tween(Slider["26"], {BackgroundColor3 = Color3.fromRGB(78, 60, 82)})
						else
							Library:tween(Slider["1e"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
							Library:tween(Slider["28"], {Color = Color3.fromRGB(112, 92, 118)})
							Library:tween(Slider["25"], {Color = Color3.fromRGB(112, 92, 118)})
							Library:tween(Slider["26"], {BackgroundColor3 = Color3.fromRGB(112, 92, 118)})	
						end
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end
			
			return Slider
		end
		
		function Tab:Dropdown(options)
			options = Library:validate({
				Name = "Preview Dropdown",
				Callback = function(v)
					print(v)
				end,
				Items = {}
			}, options or {})
			
			local Dropdown = {
				Items = {
					["Id"] = {
						"Value"
					}
				},
				Open = false,
				MouseDown = false,
				Hover = false,
				HoveringItem = false
			}
			
			-- Render
			do
				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown
				Dropdown["29"] = Instance.new("Frame", Tab["10"]);
				Dropdown["29"]["BorderSizePixel"] = 0;
				Dropdown["29"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
				Dropdown["29"]["Size"] = UDim2.new(1, 0, 0, 20);
				Dropdown["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["29"]["Name"] = [[Dropdown]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown.UICorner
				Dropdown["2a"] = Instance.new("UICorner", Dropdown["29"]);
				Dropdown["2a"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown.Title
				Dropdown["2b"] = Instance.new("TextLabel", Dropdown["29"]);
				Dropdown["2b"]["BorderSizePixel"] = 0;
				Dropdown["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2b"]["TextSize"] = 12;
				Dropdown["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2b"]["BackgroundTransparency"] = 1;
				Dropdown["2b"]["Size"] = UDim2.new(1, -20, 0, 14);
				Dropdown["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2b"]["Text"] = options["Name"];
				Dropdown["2b"]["Name"] = [[Title]];


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown.UIPadding
				Dropdown["2c"] = Instance.new("UIPadding", Dropdown["29"]);
				Dropdown["2c"]["PaddingTop"] = UDim.new(0, 3);
				Dropdown["2c"]["PaddingRight"] = UDim.new(0, 5);
				Dropdown["2c"]["PaddingLeft"] = UDim.new(0, 5);
				Dropdown["2c"]["PaddingBottom"] = UDim.new(0, 3);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown.Icon
				Dropdown["2d"] = Instance.new("ImageLabel", Dropdown["29"]);
				Dropdown["2d"]["BorderSizePixel"] = 0;
				Dropdown["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2d"]["AnchorPoint"] = Vector2.new(1, 0);
				Dropdown["2d"]["Image"] = [[rbxassetid://105985605475715]];
				Dropdown["2d"]["Size"] = UDim2.new(0, 14, 0, 14);
				Dropdown["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2d"]["BackgroundTransparency"] = 1;
				Dropdown["2d"]["Name"] = [[Icon]];
				Dropdown["2d"]["Position"] = UDim2.new(1, 0, 0, 0);


				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown.OptionHolder
				Dropdown["2e"] = Instance.new("Frame", Dropdown["29"]);
				Dropdown["2e"]["Visible"] = false;
				Dropdown["2e"]["BorderSizePixel"] = 0;
				Dropdown["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2e"]["Size"] = UDim2.new(1, 0, 1, -28);
				Dropdown["2e"]["Position"] = UDim2.new(0, 0, 0, 26);
				Dropdown["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2e"]["Name"] = [[OptionHolder]];
				Dropdown["2e"]["BackgroundTransparency"] = 1;
				
				
				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown.OptionHolder.UIListLayout
				Dropdown["35"] = Instance.new("UIListLayout", Dropdown["2e"]);
				Dropdown["35"]["Padding"] = UDim.new(0, 4);
				Dropdown["35"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
				
				
				-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown.UIStroke
				Dropdown["39"] = Instance.new("UIStroke", Dropdown["29"]);
				Dropdown["39"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Dropdown["39"]["Color"] = Color3.fromRGB(112, 92, 118);
			end
			
			-- Methods
			do
				function Dropdown:Add(Id, Value)
					local Item = {
						Hover = false,
						MouseDown = false
					}
					
					if Dropdown[Id] ~= nil then
						return
					end
					Dropdown.Items[Id] = {
						Instance = {},
						Value = Value
					}
					-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown.OptionHolder.InactiveOption
					Dropdown.Items[Id].Instance["2f"] = Instance.new("TextLabel", Dropdown["2e"]);
					Dropdown.Items[Id].Instance["2f"]["BorderSizePixel"] = 0;
					Dropdown.Items[Id].Instance["2f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Dropdown.Items[Id].Instance["2f"]["TextSize"] = 12;
					Dropdown.Items[Id].Instance["2f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown.Items[Id].Instance["2f"]["TextColor3"] = Color3.fromRGB(126, 126, 126);
					Dropdown.Items[Id].Instance["2f"]["Size"] = UDim2.new(1, 0, 0, 18);
					Dropdown.Items[Id].Instance["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown.Items[Id].Instance["2f"]["Text"] = Id;
					Dropdown.Items[Id].Instance["2f"]["Name"] = [[InactiveOption]];


					-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown.OptionHolder.InactiveOption.UIStroke
					Dropdown.Items[Id].Instance["30"] = Instance.new("UIStroke", Dropdown.Items[Id].Instance["2f"]);
					Dropdown.Items[Id].Instance["30"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					Dropdown.Items[Id].Instance["30"]["Color"] = Color3.fromRGB(112, 92, 118);


					-- StarterGui.NationLibrary.Main.ContentContainer.MainTab.Dropdown.OptionHolder.InactiveOption.UICorner
					Dropdown.Items[Id].Instance["31"] = Instance.new("UICorner", Dropdown.Items[Id].Instance["2f"]);
					Dropdown.Items[Id].Instance["31"]["CornerRadius"] = UDim.new(0, 3);
					
					Dropdown.Items[Id].Instance["2f"].MouseEnter:Connect(function()
						Item.Hover = true
						Dropdown.HoveringItem = true

						Library:tween(Dropdown.Items[Id].Instance["30"], {Color = Color3.fromRGB(78, 60, 82)})
					end)

					Dropdown.Items[Id].Instance["2f"].MouseLeave:Connect(function()
						Item.Hover = false
						Dropdown.HoveringItem = false

						if not Item.MouseDown then
							Library:tween(Dropdown.Items[Id].Instance["30"], {Color = Color3.fromRGB(112, 92, 118)})
						end
					end)

					UIS.InputBegan:Connect(function(input, gpe)
						if gpe then return end
						
						if Dropdown.Items[Id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
							Item.MouseDown = true
							Library:tween(Dropdown.Items[Id].Instance["2f"], {BackgroundColor3 = Color3.fromRGB(90, 70, 95)})
							Library:tween(Dropdown.Items[Id].Instance["30"], {Color = Color3.fromRGB(200, 200, 200)})
							options.Callback(Value)
							Dropdown:Toggle()
						end
					end)

					UIS.InputEnded:Connect(function(input, gpe)
						if gpe then return end
						
						if Dropdown.Items[Id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Item.MouseDown = false
							if Item.Hover then
								Library:tween(Dropdown.Items[Id].Instance["2f"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
								Library:tween(Dropdown.Items[Id].Instance["30"], {Color = Color3.fromRGB(78, 60, 82)})
							else
								Library:tween(Dropdown.Items[Id].Instance["2f"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
								Library:tween(Dropdown.Items[Id].Instance["30"], {Color = Color3.fromRGB(112, 92, 118)})
							end
						end
					end)
				end
				
				function Dropdown:Remove(Id)
					if Dropdown.Items[Id] ~= nil then
						if Dropdown.Items[Id].Instance ~= nil then
							for i, v in pairs(Dropdown.Items[Id].Instance) do
								v:Destroy()
							end
						end
						Dropdown.Items[Id] = nil
					end
				end

				function Dropdown:Clear()
					for i, v in pairs(Dropdown.Items) do
						Dropdown:Remove(i)
					end
				end

				function Dropdown:Toggle()
					if Dropdown.Open then
						Library:tween(Dropdown["29"], {Size = UDim2.new(1, 0, 0, 20)}, function()
							Dropdown["2e"].Visible = false
						end)
					else
						local count = 0
						for i, v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end
						
						Dropdown["2e"].Visible = true
						Library:tween(Dropdown["29"], {Size = UDim2.new(1, 0, 0, 20 + (count * 18) + 6)})
					end
					Dropdown.Open = not Dropdown.Open
				end
			end
			
			-- Logic
			do
				Dropdown["29"].MouseEnter:Connect(function()
					Dropdown.Hover = true

					Library:tween(Dropdown["39"], {Color = Color3.fromRGB(78, 60, 82)})
				end)

				Dropdown["29"].MouseLeave:Connect(function()
					Dropdown.Hover = false

					if not Dropdown.MouseDown then
						Library:tween(Dropdown["39"], {Color = Color3.fromRGB(112, 92, 118)})
					end
				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
						Dropdown.MouseDown = true
						Library:tween(Dropdown["29"], {BackgroundColor3 = Color3.fromRGB(90, 70, 95)})
						Library:tween(Dropdown["39"], {Color = Color3.fromRGB(200, 200, 200)})
						
						if not Dropdown.HoveringItem then
							Dropdown:Toggle()
						end
					end
				end)

				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dropdown.MouseDown = false
						if Dropdown.Hover then
							Library:tween(Dropdown["29"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
							Library:tween(Dropdown["39"], {Color = Color3.fromRGB(78, 60, 82)})
						else
							Library:tween(Dropdown["29"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
							Library:tween(Dropdown["39"], {Color = Color3.fromRGB(112, 92, 118)})
						end
					end
				end)
			end
			
			
			return Dropdown
		end
		
		return Tab
	end

	local NationLibrary = nation["1"]
	local PressKey = Enum.KeyCode.V

	local Open = false

	UIS.InputBegan:Connect(function(key)
		if key.KeyCode == PressKey then
			if UIS:GetFocusedTextBox() == nil then
				if Open == false then
					Open = true
					NationLibrary.Enabled = Open
				elseif Open == true then
					Open = false
					NationLibrary.Enabled = Open
				end
			end
		end
	end)
	
	return nation
end
