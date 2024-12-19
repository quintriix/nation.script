local games = {
    [{2788229376}] = "https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/nation.dahood", -- DaHood
    [{4483381587}] = "https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/nation.dahood", -- BasePlate
    [{103539521748777}] = "https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/nation.dahood", -- FlameHood
    [{88582222971530}] = "https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/nation.dahood" -- DelHood
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
        break
    end
end
