
local function ParseChild(Tree, Level, Connector)
    local str = "\n"
    local Level = Level or 0
    local Connector = Connector or -1
    Connector = Connector + 1
  
    for i,v in next, Tree do
        str = str .. "│    "
        str = str .. string.rep("     ", Level - Connector) .. string.rep("│    ", Connector)

        if i == #Tree then
            str = str .. "└── "
        else
            str = str .. "├── "
        end

        str = str .. v.Name
        if not v.Children then v.Children = {} end
        if i == #Tree then Connector = Connector - 1 end
        if v.Children then
            str = str .. ParseChild(v.Children, Level + 1, Connector)
        end
    end
    
    return str
end

local Branches = {}
function Branches.new(Tree)
    return string.format("\n├── %s", Tree.Name) .. ParseChild(Tree.Children)
end

return Branches
