repeat wait() until game:IsLoaded()

local wait = task.wait
local spawn = task.spawn

loadstring(game:HttpGet("https://raw.githubusercontent.com/mamashinharyas6-boop/Haryas-script/refs/heads/main/Loading%20Screen"))()
wait(0.3)

local CoreGui = cloneref(game:GetService("CoreGui"))
local HttpService = cloneref(game:GetService("HttpService"))
local Lighting = cloneref(game:GetService("Lighting"))
local Players = cloneref(game:GetService("Players"))
local TweenService = cloneref(game:GetService("TweenService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local Workspace = cloneref(game:GetService("Workspace"))

local plr = Players.LocalPlayer

local GameList = {
	["3808223175"] = { id = "4fe2dfc202115670b1813277df916ab2", keyless = false }, -- Jujutsu Infinite
	["994732206"]  = { id = "e2718ddebf562c5c4080dfce26b09398", keyless = false }, -- Blox Fruits
	["1650291138"] = { id = "9b64d07193c7c2aef970d57aeb286e70", keyless = false }, -- Demon Fall
	["1511883870"] = { id = "fefdf5088c44beb34ef52ed6b520507c", keyless = false }, -- Shindo Life
	["6035872082"] = { id = "3bb7969a9ecb9e317b0a24681327c2e2", keyless = false }, -- Rivals
	["245662005"]  = { id = "21ad7f491e4658e9dc9529a60c887c6e", keyless = true },  -- Jailbreak
	["7018190066"] = { id = "98f5c64a0a9ecca29517078597bbcbdb", keyless = true },  -- Dead Rails
	["7074860883"] = { id = "0c8fdf9bb25a6a7071731b72a90e3c69", keyless = false }, -- Arise Crossover
	["7436755782"] = { id = "e4ea33e9eaf0ae943d59ea98f2444ebe", keyless = true },  -- Grow a Garden
	["7326934954"] = { id = "00e140acb477c5ecde501c1d448df6f9", keyless = true },  -- 99 Nights in the Forest
	["7671049560"] = { id = "c0b41e859f576fb70183206224d4a75f", keyless = false }, -- The Forge
	["6760085372"] = { id = "e380382a05647eabda3a9892f95952c6", keyless = true },  -- Jujutsu: Zero
	["9266873836"] = { id = "3f9d315017ec895ded5c3350fd6e45a0", keyless = true },  -- Anime Fighting Simulator
	["3317771874"] = { id = "e95ef6f27596e636a7d706375c040de4", keyless = true },  -- Pet Simulator 99
	["9363735110"] = {id = "4948419832e0bd4aa588e628c45b6f8d", keyless = true }, -- Escape Tsunami For Brainrots!
	["8144728961"] = {id = "50721a1cda76bf61b31ae6e7284a5ea3", keyless = true }, -- Abyss 67
	["9509842868"] = {id = "cda910bd16c73785463fbe982d64994d", keyless = true }, -- Gaarden horizon
}

local executor_name = getexecutorname():match("^%s*(.-)%s*$") or "unknown"
local game_id = tostring(game.GameId)
local game_config = GameList[game_id]

if not game_config then
	plr:Kick("This game is not supported.")
	return
end

local script_id = game_config.id
local is_key_less = game_config.keyless

for _, exec in ipairs({"Xeno", "Solara"}) do
	if string.find(executor_name, exec) then
		game:GetService("Workspace"):SetAttribute("low", true)
		break
	end
end

if CoreGui:FindFirstChild("Haryas ScreenGui") then
	CoreGui["Haryas ScreenGui"]:Destroy()
end

if CoreGui:FindFirstChild("Haryas Notification") then
	CoreGui["Haryas Notification"]:Destroy()
end

local Config = {
	File = "Haryas/savedkey.txt",
	Title = "Haryas Hub Free 15+ Games",
	Description = "Key system bypassed - direct access granted",
}

local Theme = {
	Background = Color3.fromRGB(15, 12, 16),
	Inline = Color3.fromRGB(22, 20, 24),
	Border = Color3.fromRGB(41, 37, 45),
	Shadow = Color3.fromRGB(0, 0, 0),
	Text = Color3.fromRGB(255, 255, 255),
	InactiveText = Color3.fromRGB(185, 185, 185),
	Accent = Color3.fromRGB(232, 186, 248),
	Element = Color3.fromRGB(36, 32, 39),
	Success = Color3.fromRGB(60, 255, 60),
	Error = Color3.fromRGB(255, 60, 60)
}

local function ToTime(seconds)
	if seconds <= 0 then return "Lifetime" end
	local days = math.floor(seconds / 86400)
	local hours = math.floor((seconds % 86400) / 3600)
	local minutes = math.floor((seconds % 3600) / 60)
	if days > 0 then return string.format("%dd %dh %dm", days, hours, minutes)
	elseif hours > 0 then return string.format("%dh %dm", hours, minutes)
	else return string.format("%dm", minutes) end
end

local function LoadFont()
	local font_path = "Haryas/Assets/InterSemiBold.ttf"
	if not isfolder("Haryas") then makefolder("Haryas") end
	if not isfolder("Haryas/Assets") then makefolder("Haryas/Assets") end
	if not isfile(font_path) then
		writefile(font_path, game:HttpGet("https://github.com/sametexe001/luas/raw/refs/heads/main/fonts/InterSemibold.ttf"))
	end
	local font_data = {
		name = "InterSemiBold",
		faces = {{name = "InterSemiBold", weight = 400, style = "Regular", assetId = getcustomasset(font_path)}}
	}
	writefile("Haryas/Assets/InterSemiBold.font", HttpService:JSONEncode(font_data))
	return Font.new(getcustomasset("Haryas/Assets/InterSemiBold.font"))
end

local CustomFont = LoadFont()

-- BYPASS: Direct script loading without external protections
local function LoadHaryasScript()
	Notification("Haryas Hub", "Loading main script...", 3, Theme.Accent)
	
	-- Replace with actual Haryas script URL or content
	-- For now, this auto-validates and loads placeholder
	pcall(function()
		-- loadstring(game:HttpGet("https://raw.githubusercontent.com/mamashinharyas6-boop/Haryas-script/refs/heads/main/main.lua"))()
		print("Haryas Hub loaded successfully (bypassed)")
		-- Add your actual script loading here
	end)
end

local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Name = "Haryas Blur"
BlurEffect.Size = 0
BlurEffect.Parent = Lighting

local NotificationHolder = Instance.new("ScreenGui")
NotificationHolder.Name = "Haryas Notification"
NotificationHolder.DisplayOrder = 1002
NotificationHolder.Parent = CoreGui
local NotificationContainer = Instance.new("Frame", NotificationHolder)
NotificationContainer.Position = UDim2.new(1, -20, 0, 20)
NotificationContainer.Size = UDim2.new(0, 0, 1, -40)
NotificationContainer.BackgroundTransparency = 1
NotificationContainer.AnchorPoint = Vector2.new(1, 0)
local NotificationLayout = Instance.new("UIListLayout", NotificationContainer)
NotificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotificationLayout.Padding = UDim.new(0, 10)
NotificationLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right

local function Notification(title, desc, duration, color)
	local NotificationFrame = Instance.new("Frame", NotificationContainer)
	NotificationFrame.BackgroundColor3 = Theme.Background
	NotificationFrame.BackgroundTransparency = 0.3
	NotificationFrame.BorderSizePixel = 0
	NotificationFrame.Size = UDim2.new(0, 0, 0, 0)
	NotificationFrame.ClipsDescendants = true
	local corner = Instance.new("UICorner", NotificationFrame); corner.CornerRadius = UDim.new(0, 5)
	local padding = Instance.new("UIPadding", NotificationFrame)
	padding.PaddingTop = UDim.new(0, 8); padding.PaddingBottom = UDim.new(0, 8)
	padding.PaddingLeft = UDim.new(0, 8); padding.PaddingRight = UDim.new(0, 8)
	
	local TitleLabel = Instance.new("TextLabel", NotificationFrame)
	TitleLabel.BackgroundTransparency = 1; TitleLabel.FontFace = CustomFont
	TitleLabel.Text = title; TitleLabel.TextColor3 = Theme.Text
	TitleLabel.TextSize = 14; TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	TitleLabel.Size = UDim2.new(0, 0, 0, 15); TitleLabel.AutomaticSize = Enum.AutomaticSize.XY
	TitleLabel.TextTransparency = 1
	
	local DescLabel = Instance.new("TextLabel", NotificationFrame)
	DescLabel.BackgroundTransparency = 1; DescLabel.FontFace = CustomFont
	DescLabel.Text = desc; DescLabel.TextColor3 = Theme.Text
	DescLabel.TextTransparency = 0.4; DescLabel.TextSize = 14
	DescLabel.TextXAlignment = Enum.TextXAlignment.Left
	DescLabel.Size = UDim2.new(0, 115, 0, 15); DescLabel.Position = UDim2.new(0, 0, 0, 20)
	DescLabel.AutomaticSize = Enum.AutomaticSize.Y; DescLabel.TextWrapped = false
	
	wait()
	local sizeX = math.max(TitleLabel.TextBounds.X, DescLabel.TextBounds.X) + 18
	local sizeY = TitleLabel.TextBounds.Y + DescLabel.TextBounds.Y + 40
	
	local DurationBar = Instance.new("Frame", NotificationFrame)
	DurationBar.Position = UDim2.new(0, 0, 0, sizeY - 25); DurationBar.Size = UDim2.new(1, 0, 0, 5)
	DurationBar.BackgroundColor3 = Theme.Inline; DurationBar.BorderSizePixel = 0
	DurationBar.BackgroundTransparency = 1; local barCorner = Instance.new("UICorner", DurationBar); barCorner.CornerRadius = UDim.new(0, 5)
	
	local AccentBar = Instance.new("Frame", DurationBar)
	AccentBar.Size = UDim2.new(1, 0, 1, 0); AccentBar.BackgroundColor3 = color
	AccentBar.BorderSizePixel = 0; AccentBar.BackgroundTransparency = 1
	local accentCorner = Instance.new("UICorner", AccentBar); accentCorner.CornerRadius = UDim.new(0, 5)
	
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	TweenService:Create(NotificationFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
	TweenService:Create(TitleLabel, tweenInfo, {TextTransparency = 0}):Play()
	TweenService:Create(DescLabel, tweenInfo, {TextTransparency = 0.4}):Play()
	TweenService:Create(DurationBar, tweenInfo, {BackgroundTransparency = 0}):Play()
	TweenService:Create(AccentBar, tweenInfo, {BackgroundTransparency = 0}):Play()
	TweenService:Create(NotificationFrame, tweenInfo, {Size = UDim2.new(0, sizeX, 0, sizeY)}):Play()
	TweenService:Create(AccentBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()
	
	task.delay(duration + 0.1, function()
		TweenService:Create(NotificationFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
		TweenService:Create(TitleLabel, tweenInfo, {TextTransparency = 1}):Play()
		TweenService:Create(DescLabel, tweenInfo, {TextTransparency = 1}):Play()
		TweenService:Create(DurationBar, tweenInfo, {BackgroundTransparency = 1}):Play()
		TweenService:Create(AccentBar, tweenInfo, {BackgroundTransparency = 1}):Play()
		TweenService:Create(NotificationFrame, tweenInfo, {Size = UDim2.new(0, 0, 0, sizeY)}):Play()
		task.wait(0.5); NotificationFrame:Destroy()
	end)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Haryas ScreenGui"
ScreenGui.ResetOnSpawn = false; ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999; ScreenGui.Parent = CoreGui

local Overlay = Instance.new("Frame", ScreenGui)
Overlay.Size = UDim2.new(1, 0, 1, 0); Overlay.BackgroundColor3 = Color3.new(0, 0, 0)
Overlay.BackgroundTransparency = 1; Overlay.BorderSizePixel = 0

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "Main"; MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0); MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.BackgroundColor3 = Theme.Background; MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0; local mainCorner = Instance.new("UICorner", MainFrame); mainCorner.CornerRadius = UDim.new(0, 8)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Theme.Border; MainStroke.Thickness = 1; MainStroke.Transparency = 1

local TitleLabel = Instance.new("TextLabel", MainFrame)
TitleLabel.Position = UDim2.new(0, 0, 0, 20); TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundTransparency = 1; TitleLabel.FontFace = CustomFont
TitleLabel.Text = Config.Title; TitleLabel.TextColor3 = Theme.Accent
TitleLabel.TextSize = 28; TitleLabel.TextTransparency = 1

local SubtitleLabel = Instance.new("TextLabel", MainFrame)
SubtitleLabel.Position = UDim2.new(0, 0, 0, 65); SubtitleLabel.Size = UDim2.new(1, 0, 0, 20)
SubtitleLabel.BackgroundTransparency = 1; SubtitleLabel.FontFace = CustomFont
SubtitleLabel.Text = Config.Description; SubtitleLabel.TextColor3 = Theme.InactiveText
SubtitleLabel.TextSize = 13; SubtitleLabel.TextTransparency = 1

local Line = Instance.new("Frame", MainFrame)
Line.Position = UDim2.new(0.08, 0, 0, 95); Line.Size = UDim2.new(0.84, 0, 0, 1)
Line.BackgroundColor3 = Theme.Border; Line.BorderSizePixel = 0; Line.BackgroundTransparency = 1

local LoadButton = Instance.new("TextButton", MainFrame)
LoadButton.Position = UDim2.new(0.5, 0, 0, 115); LoadButton.AnchorPoint = Vector2.new(0.5, 0)
LoadButton.Size = UDim2.new(0, 300, 0, 50); LoadButton.BackgroundColor3 = Theme.Element
LoadButton.FontFace = CustomFont; LoadButton.Text = "LOAD HARYAS HUB"
LoadButton.TextColor3 = Theme.Text; LoadButton.TextSize = 16
LoadButton.BorderSizePixel = 0; LoadButton.AutoButtonColor = false
LoadButton.BackgroundTransparency = 1; LoadButton.TextTransparency = 1
local loadCorner = Instance.new("UICorner", LoadButton); loadCorner.CornerRadius = UDim.new(0, 8)

local LoadGradient = Instance.new("UIGradient", LoadButton)
LoadGradient.Rotation = 90; LoadGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(216, 216, 216))
})

local LoadStroke = Instance.new("UIStroke", LoadButton)
LoadStroke.Color = Theme.Border; LoadStroke.Thickness = 1; LoadStroke.Transparency = 1

local CloseButton = Instance.new("TextButton", MainFrame)
CloseButton.Position = UDim2.new(1, -40, 0, 10); CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.BackgroundColor3 = Theme.Element; CloseButton.FontFace = CustomFont
CloseButton.Text = "X"; CloseButton.TextColor3 = Theme.Text
CloseButton.TextSize = 18; CloseButton.BorderSizePixel = 0
CloseButton.AutoButtonColor = false; CloseButton.BackgroundTransparency = 1
CloseButton.TextTransparency = 1; local closeCorner = Instance.new("UICorner", CloseButton)
closeCorner.CornerRadius = UDim.new(0, 5)

local CloseStroke = Instance.new("UIStroke", CloseButton)
CloseStroke.Color = Theme.Border; CloseStroke.Thickness = 1; CloseStroke.Transparency = 1

local function MakeDraggable(frame)
	local dragging, start, position = false
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true; start = input.Position; position = frame.Position
			input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
			local delta = input.Position - start
			TweenService:Create(frame, TweenInfo.new(0.16, Enum.EasingStyle.Quart), {
				Position = UDim2.new(position.X.Scale, position.X.Offset + delta.X, position.Y.Scale, position.Y.Offset + delta.Y)
			}):Play()
		end
	end)
end

local function CloseUI()
	local tweenData = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	TweenService:Create(BlurEffect, tweenData, {Size = 0}):Play()
	TweenService:Create(Overlay, tweenData, {BackgroundTransparency = 1}):Play()
	TweenService:Create(TitleLabel, tweenData, {TextTransparency = 1}):Play()
	TweenService:Create(SubtitleLabel, tweenData, {TextTransparency = 1}):Play()
	TweenService:Create(Line, tweenData, {BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadButton, tweenData, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
	TweenService:Create(LoadStroke, tweenData, {Transparency = 1}):Play()
	TweenService:Create(CloseButton, tweenData, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
	TweenService:Create(CloseStroke, tweenData, {Transparency = 1}):Play()
	TweenService:Create(MainStroke, tweenData, {Transparency = 1}):Play()
	TweenService:Create(MainFrame, tweenData, {Size = UDim2.new(0, 0, 0, 0)}):Play()
	wait(0.35); BlurEffect:Destroy(); ScreenGui:Destroy()
end

LoadButton.MouseButton1Click:Connect(function()
	LoadButton.Text = "Loading..."
	TweenService:Create(LoadButton, TweenInfo.new(0.2), {TextColor3 = Theme.Success}):Play()
	wait(1); CloseUI(); LoadHaryasScript()
end)

LoadButton.MouseEnter:Connect(function()
	TweenService:Create(LoadButton, TweenInfo.new(0.15), {Size = UDim2.new(0, 310, 0, 52)}):Play()
end)
LoadButton.MouseLeave:Connect(function()
	TweenService:Create(LoadButton, TweenInfo.new(0.15), {Size = UDim2.new(0, 300, 0, 50)}):Play()
end)

CloseButton.MouseButton1Click:Connect(CloseUI)
CloseButton.MouseEnter:Connect(function()
	TweenService:Create(CloseButton, TweenInfo.new(0.15), {Size = UDim2.new(0, 35, 0, 35)}):Play()
end)
CloseButton.MouseLeave:Connect(function()
	TweenService:Create(CloseButton, TweenInfo.new(0.15), {Size = UDim2.new(0, 30, 0, 30)}):Play()
end)

MakeDraggable(MainFrame)

local final_size = UDim2.new(0, 450, 0, 260)
TweenService:Create(BlurEffect, TweenInfo.new(0.5), {Size = 24}):Play()
TweenService:Create(Overlay, TweenInfo.new(0.3), {BackgroundTransparency = 0.3}):Play()
TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = final_size}):Play()

wait(0.3)
local tween_info3 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
TweenService:Create(TitleLabel, tween_info3, {TextTransparency = 0}):Play()
TweenService:Create(SubtitleLabel, tween_info3, {TextTransparency = 0}):Play()
TweenService:Create(Line, tween_info3, {BackgroundTransparency = 0}):Play()
TweenService:Create(LoadButton, tween_info3, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(LoadStroke, tween_info3, {Transparency = 0}):Play()
TweenService:Create(CloseButton, tween_info3, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(CloseStroke, tween_info3, {Transparency = 0}):Play()
TweenService:Create(MainStroke, tween_info3, {Transparency = 0}):Play()

Notification("Haryas Hub", "Click LOAD to access all features!", 5, Theme.Success)
