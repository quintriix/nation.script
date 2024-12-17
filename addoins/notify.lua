local NotificationLibrary = {}

local NationNotify = Instance.new("ScreenGui"); NationNotify.Name = "NationNotify"; NationNotify.Parent = game.CoreGui; NationNotify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling; NationNotify.IgnoreGuiInset = true

function NotificationLibrary:Notify(TitleText, Desc, Delay)

    local NotificationLibrary = {};

    -- StarterGui.NationNotify.Holder
    NotificationLibrary["2"] = Instance.new("Frame", NotificationLibrary["1"]);
    NotificationLibrary["2"]["BorderSizePixel"] = 0;
    NotificationLibrary["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    NotificationLibrary["2"]["AnchorPoint"] = Vector2.new(0, 1);
    NotificationLibrary["2"]["Size"] = UDim2.new(1, 0, 1, 0);
    NotificationLibrary["2"]["Position"] = UDim2.new(0, 0, 1, 0);
    NotificationLibrary["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    NotificationLibrary["2"]["Name"] = [[Holder]];
    NotificationLibrary["2"]["BackgroundTransparency"] = 1;
    
    
    -- StarterGui.NationNotify.Holder.notify
    NotificationLibrary["3"] = Instance.new("Frame", NotificationLibrary["2"]);
    NotificationLibrary["3"]["BorderSizePixel"] = 0;
    NotificationLibrary["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    NotificationLibrary["3"]["Size"] = UDim2.new(0, 185, 0, 20);
    NotificationLibrary["3"]["Position"] = UDim2.new(0.31752, 0, 0.96086, 0);
    NotificationLibrary["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    NotificationLibrary["3"]["Name"] = [[notify]];
    NotificationLibrary["3"]["BackgroundTransparency"] = 1;
    
    
    -- StarterGui.NationNotify.Holder.notify.TitleText
    NotificationLibrary["4"] = Instance.new("TextLabel", NotificationLibrary["3"]);
    NotificationLibrary["4"]["TextStrokeTransparency"] = 0;
    NotificationLibrary["4"]["BorderSizePixel"] = 0;
    NotificationLibrary["4"]["TextXAlignment"] = Enum.TextXAlignment.Right;
    NotificationLibrary["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    NotificationLibrary["4"]["TextSize"] = 15;
    NotificationLibrary["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    NotificationLibrary["4"]["TextColor3"] = Color3.fromRGB(127, 0, 255);
    NotificationLibrary["4"]["BackgroundTransparency"] = 1;
    NotificationLibrary["4"]["Size"] = UDim2.new(0.5, 0, 1, 0);
    NotificationLibrary["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    NotificationLibrary["4"]["Text"] = TitleText;
    NotificationLibrary["4"]["Name"] = TitleText;
    
    
    -- StarterGui.NationNotify.Holder.notify.TitleText.UIPadding
    NotificationLibrary["5"] = Instance.new("UIPadding", NotificationLibrary["4"]);
    NotificationLibrary["5"]["PaddingRight"] = UDim.new(0, 2);
    
    
    -- StarterGui.NationNotify.Holder.notify.Desc
    NotificationLibrary["6"] = Instance.new("TextLabel", NotificationLibrary["3"]);
    NotificationLibrary["6"]["TextWrapped"] = true;
    NotificationLibrary["6"]["TextStrokeTransparency"] = 0;
    NotificationLibrary["6"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
    NotificationLibrary["6"]["BorderSizePixel"] = 0;
    NotificationLibrary["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    NotificationLibrary["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    NotificationLibrary["6"]["TextSize"] = 15;
    NotificationLibrary["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    NotificationLibrary["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    NotificationLibrary["6"]["BackgroundTransparency"] = 1;
    NotificationLibrary["6"]["AnchorPoint"] = Vector2.new(1, 0);
    NotificationLibrary["6"]["Size"] = UDim2.new(0.5, 0, 1, 0);
    NotificationLibrary["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    NotificationLibrary["6"]["Text"] = Desc;
    NotificationLibrary["6"]["Position"] = UDim2.new(1, 0, 0, 0);
    NotificationLibrary["6"]["Name"] = Desc;
    
    
    -- StarterGui.NationNotify.Holder.notify.Desc.UIPadding
    NotificationLibrary["7"] = Instance.new("UIPadding", NotificationLibrary["6"]);
    NotificationLibrary["7"]["PaddingLeft"] = UDim.new(0, 2);
    
    
    -- StarterGui.NationNotify.Holder.notify.line
    NotificationLibrary["8"] = Instance.new("Frame", NotificationLibrary["3"]);
    NotificationLibrary["8"]["BorderSizePixel"] = 0;
    NotificationLibrary["8"]["BackgroundColor3"] = Color3.fromRGB(128, 0, 255);
    NotificationLibrary["8"]["Size"] = UDim2.new(0.2973, 0, 0, 1);
    NotificationLibrary["8"]["Position"] = UDim2.new(0, 0, 1, 0);
    NotificationLibrary["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    NotificationLibrary["8"]["Name"] = [[line]];
    
    
    -- StarterGui.NationNotify.Holder.UIListLayout
    NotificationLibrary["9"] = Instance.new("UIListLayout", NotificationLibrary["2"]);
    NotificationLibrary["9"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
    NotificationLibrary["9"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom;
    NotificationLibrary["9"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
    
    
    -- StarterGui.NationNotify.Holder.UIPadding
    NotificationLibrary["a"] = Instance.new("UIPadding", NotificationLibrary["2"]);
    NotificationLibrary["a"]["PaddingBottom"] = UDim.new(0, 120);

	NotificationLibrary["8"]:TweenSize(UDim2.new(0, 450, 0, 4), "Out", "Linear", Delay)
	wait(0.1)
	NotificationLibrary["2"]:Destroy()
end

return NotificationLibrary
