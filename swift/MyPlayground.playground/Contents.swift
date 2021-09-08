import Cocoa

class BalancedBinaryTree {
    
    var isBalance = true

    func helper(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        
        let left = helper(root?.left)
        let right = helper(root?.right)
        if abs(left - right) > 1 {
            isBalance = false
        }
        return max(left, right) + 1
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        let _ = helper(root)
        return isBalance
    }
    
}
