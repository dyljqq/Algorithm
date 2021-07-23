import Cocoa

public class TreeNode: NSObject {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    init(val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public override var description: String {
        return "\(self.val)"
    }
    
}

class Solution {
    
    func helper(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        guard let B = B else {
            return true
        }
        
        guard let A = A, A.val == B.val else {
            return false
        }
        return helper(A.left, B.left) && helper(A.right, B.right)
    }
    
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        guard let A = A, let B = B else {
            return false
        }
        return A.val == B.val && helper(A, B) || isSubStructure(A.left, B) || isSubStructure(A.right, B)
    }
}

var A = TreeNode(val: 3)
A.left = TreeNode(val: 4)
A.right = TreeNode(val: 5)
A.left?.left = TreeNode(val: 1)
A.left?.right = TreeNode(val: 2)

var B = TreeNode(val: 4)
B.left = TreeNode(val: 1)

let solution = Solution()
print(solution.isSubStructure(A, B))
