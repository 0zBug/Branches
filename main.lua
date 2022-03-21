
local function ParseChild(tree, level, connector)
    local str = "\n"
    for i,v in next, tree do
        str = str .. "│    "
        if connector then
            str = str .. string.rep("     ", level - 1) .. "│    "
        else
            str = str .. string.rep("     ", level)
        end

        if i == #tree then
            str = str .. "└── "
        else
            str = str .. "├── "
        end

        str = str .. v.Name
        if v.Children then
            str = str .. ParseChild(v.Children, level + 1, i ~= #tree)
        end
    end
    
    return str
end

local Branches = {}
function Branches.new(Tree)
    return string.format("\n├── %s", Tree.Name) .. ParseChild(Tree.Children, level or 0)
end

return Branches
