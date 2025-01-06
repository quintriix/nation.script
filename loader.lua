loadstring(game:HttpGet("https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/nation.dahood"))()


pcall(function()
    local inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/extras/source.lua"))()
    inviter.Join("discord.gg/qm2KAzZxA9")
end)

local games = {
    [{2788229376}] = "https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/nation.dahood", -- DA HOOD
    [{3956818381}] = "", -- NINJA LEGENDS
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
        break
    end
end
