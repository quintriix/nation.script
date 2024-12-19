local ids = {
    [{2788229376}], -- DaHood
    [{4483381587}], -- Baseplate
    [{103539521748777}], -- FlameHood
    [{88582222971530}] -- DelHood
    
}

local games = {
    ids = "https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/nation.dahood",
    ids = "https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/nation.dahood"
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
        break
    end
end
