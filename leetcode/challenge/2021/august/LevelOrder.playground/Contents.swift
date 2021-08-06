import Cocoa

class Node {
    
    var val: Int
    var children: [Node]
    
    init(_ val: Int) {
        self.val = val
        self.children = []
    }
    
}

class Solution {
    
    var res: [[Int]] = []
    
    func helper(_ root: Node?, level: Int) {
        guard let root = root else {
            return
        }
        
        if level < res.count {
            res[level].append(root.val)
        } else {
            res.append([root.val])
        }
        
        for child in root.children {
            helper(child, level: level + 1)
        }
    }
    
    func levelOrder(_ root: Node?) -> [[Int]] {
        helper(root, level: 0)
        return res
    }
}

let node = Node(1)
node.children = [3, 2, 4].map { Node($0) }
node.children[0].children = [5, 6].map { Node($0) }
print(levelOrder(node))
