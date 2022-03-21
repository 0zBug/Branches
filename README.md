# Branches
A simple lua module inspired by bash's tree command.

# Example
```
local Tree = Branches.new({
    Name = "Root",
    Children = {
        {
            Name = "Branch",
            Children = {
                {
                    Name = "Leaf",
                    Children = {}
                },
                {
                    Name = "Leaf",
                    Children = {}
                }
            }
        }
    }
})

print(Tree)
```

# Output
```
├── Root
│    └── Branch
│         ├── Leaf
│         └── Leaf
```
