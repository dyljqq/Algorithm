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
    
    func helper(left: Int, right: Int, root: Int, preorder: [Int], hash: [Int: Int]) -> TreeNode? {
        guard left <= right else {
            return nil
        }
        let val = preorder[root]
        let node = TreeNode(val: val)
        let index = hash[val]!
        let leftSize = index - left
        node.left = helper(left: left, right: index - 1, root: root + 1, preorder: preorder, hash: hash)
        node.right = helper(left: index + 1, right: right, root: root + leftSize + 1, preorder: preorder, hash: hash)
        
        return node
    }
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var hash: [Int: Int] = [:]
        inorder.enumerated().forEach { hash[$1] = $0 }
        return helper(left: 0, right: inorder.count - 1, root: 0, preorder: preorder, hash: hash)
    }
}

let solution = Solution()
let node = solution.buildTree([1,2,3], [3,2,1])
print(node?.val)
