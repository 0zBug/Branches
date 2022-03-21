
local function ParseChild(Tree, Level, Connector)
    local str = "\n"
    local Level = Level or 0
    for i,v in next, Tree do
        str = str .. "│    "
        if Connector then
            str = str .. string.rep("     ", Level - 1) .. "│    "
        else
            str = str .. string.rep("     ", Level)
        end

        if i == #Tree then
            str = str .. "└── "
        else
            str = str .. "├── "
        end

        str = str .. v.Name
        if not v.Children then v.Children = {} end
        if v.Children then
            str = str .. ParseChild(v.Children, Level + 1, i ~= #Tree)
        end
    end
    
    return str
end

local Branches = {}
function Branches.new(Tree)
    return string.format("\n├── %s", Tree.Name) .. ParseChild(Tree.Children)
end

return Branches
