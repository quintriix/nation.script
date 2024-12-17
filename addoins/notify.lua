local NotificationLibrary = {}

local NationNotify = game.CoreGui:FindFirstChild("NationNotify")
local Holder = NationNotify:FindFirstChild("Holder")

if not NationNotify then
    NationNotify = Instance.new("ScreenGui")
    NationNotify.Name = "NationNotify"
    NationNotify.Parent = game.CoreGui
    NationNotify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    NationNotify.IgnoreGuiInset = true
end

if not Holder then
    Holder = Instance.new("Frame")
    Holder.Parent = NationNotify
    Holder.BorderSizePixel = 0
    Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Holder.AnchorPoint = Vector2.new(0, 1)
    Holder.Size = UDim2.new(1, 0, 1, 0)
    Holder.Position = UDim2.new(0, 0, 1, 0)
    Holder.BackgroundTransparency = 1
    Holder.Name = "Holder"

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = Holder
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    Layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    local HolderPadding = Instance.new("UIPadding")
    HolderPadding.Parent = Holder
    HolderPadding.PaddingBottom = UDim.new(0, 120)
end

function NotificationLibrary:Notify(TitleText, Desc, Delay)

    local Notification = Instance.new("Frame")
    local TitleTextLabel = Instance.new("TextLabel")
    local TitlePadding = Instance.new("UIPadding")
    local DescTextLabel = Instance.new("TextLabel")
    local DescPadding = Instance.new("UIPadding")
    local Line = Instance.new("Frame")
    
    Notification.Parent = Holder
    Notification.BorderSizePixel = 0
    Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Notification.Size = UDim2.new(0, 185, 0, 20)
    Notification.Position = UDim2.new(0.31752, 0, 0.96086, 0)
    Notification.BackgroundTransparency = 1
    Notification.Name = "notify"
    
    TitleTextLabel.Parent = Notification
    TitleTextLabel.TextStrokeTransparency = 0
    TitleTextLabel.BorderSizePixel = 0
    TitleTextLabel.TextXAlignment = Enum.TextXAlignment.Right
    TitleTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleTextLabel.TextSize = 15
    TitleTextLabel.FontFace = Font.fromName("SourceSansPro", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    TitleTextLabel.TextColor3 = Color3.fromRGB(127, 0, 255)
    TitleTextLabel.BackgroundTransparency = 1
    TitleTextLabel.Size = UDim2.new(0.5, 0, 1, 0)
    TitleTextLabel.Text = TitleText
    TitleTextLabel.Name = TitleText

    TitlePadding.Parent = TitleTextLabel
    TitlePadding.PaddingRight = UDim.new(0, 2)

    DescTextLabel.Parent = Notification
    DescTextLabel.TextWrapped = true
    DescTextLabel.TextStrokeTransparency = 0
    DescTextLabel.TextTruncate = Enum.TextTruncate.AtEnd
    DescTextLabel.BorderSizePixel = 0
    DescTextLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DescTextLabel.TextSize = 15
    DescTextLabel.FontFace = Font.fromName("SourceSansPro", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    DescTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    DescTextLabel.BackgroundTransparency = 1
    DescTextLabel.AnchorPoint = Vector2.new(1, 0)
    DescTextLabel.Size = UDim2.new(0.5, 0, 1, 0)
    DescTextLabel.Text = Desc
    DescTextLabel.Name = Desc
    DescTextLabel.Position = UDim2.new(1, 0, 0, 0)

    DescPadding.Parent = DescTextLabel
    DescPadding.PaddingLeft = UDim.new(0, 2)

    Line.Parent = Notification
    Line.BorderSizePixel = 0
    Line.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
    Line.Size = UDim2.new(0, 185, 0, 2)
    Line.Position = UDim2.new(0, 0, 1, 0)
    Line.Name = "line"

    Line:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", Delay)
    wait(Delay)
    Notification:Destroy()
end

return NotificationLibrary
