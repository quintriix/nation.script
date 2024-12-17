local NotificationLibrary = {}

-- Crear una nueva GUI
local NationNotify = Instance.new("ScreenGui")
NationNotify.Name = "NationNotify"
NationNotify.Parent = game.CoreGui
NationNotify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
NationNotify.IgnoreGuiInset = true

function NotificationLibrary:Notify(TitleText, Desc, Delay)

    -- Crear el contenedor principal
    local Holder = Instance.new("Frame")
    Holder.Parent = NationNotify
    Holder.BorderSizePixel = 0
    Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Holder.AnchorPoint = Vector2.new(0, 1)
    Holder.Size = UDim2.new(1, 0, 1, 0)
    Holder.Position = UDim2.new(0, 0, 1, 0)
    Holder.BackgroundTransparency = 1
    Holder.Name = "Holder"
    
    -- Crear el contenedor de la notificación
    local Notification = Instance.new("Frame")
    Notification.Parent = Holder
    Notification.BorderSizePixel = 0
    Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Notification.Size = UDim2.new(0, 185, 0, 20)
    Notification.Position = UDim2.new(0.31752, 0, 0.96086, 0)
    Notification.BackgroundTransparency = 1
    Notification.Name = "notify"
    
    -- Crear el título de la notificación
    local TitleTextLabel = Instance.new("TextLabel")
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
    TitleTextLabel.Name = "TitleText"
    
    -- Añadir padding al título
    local TitlePadding = Instance.new("UIPadding")
    TitlePadding.Parent = TitleTextLabel
    TitlePadding.PaddingRight = UDim.new(0, 2)
    
    -- Crear la descripción de la notificación
    local DescTextLabel = Instance.new("TextLabel")
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
    DescTextLabel.Name = "DescText"
    DescTextLabel.Position = UDim2.new(1, 0, 0, 0)
    
    -- Añadir padding a la descripción
    local DescPadding = Instance.new("UIPadding")
    DescPadding.Parent = DescTextLabel
    DescPadding.PaddingLeft = UDim.new(0, 2)
    
    -- Crear la línea de separación
    local Line = Instance.new("Frame")
    Line.Parent = Notification
    Line.BorderSizePixel = 0
    Line.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
    Line.Size = UDim2.new(0, 185, 0, 2)
    Line.Position = UDim2.new(0, 0, 1, 0)
    Line.Name = "line"
    
    -- Crear el layout para organizar los elementos
    local Layout = Instance.new("UIListLayout")
    Layout.Parent = Holder
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    Layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Añadir padding al Holder
    local HolderPadding = Instance.new("UIPadding")
    HolderPadding.Parent = Holder
    HolderPadding.PaddingBottom = UDim.new(0, 120)

    -- Animar la línea y la notificación
    Line:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", Delay)
    wait(0.35)
    Holder:Destroy()  -- Eliminar la notificación después de animar
end

return NotificationLibrary
