local games = {
    [{2788229376}] = "https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/nation.dahood",
    [{4483381587}] = "https://raw.githubusercontent.com/quintriix/nation.script/refs/heads/main/addoins/nation.dahood"
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
        break
    end
end
