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
    
    func traverse() {
        print(self.val)
        self.left?.traverse()
        self.right?.traverse()
    }
    
    static func build(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else {
            return nil
        }
        
        let root = TreeNode(val: nums.first!)
        var queue: [TreeNode] = [root]
        
        var count = 1
        while queue.isEmpty || count < nums.count {
            let top = queue.first!
            top.left = TreeNode(val: nums[count])
            queue.append(top.left!)
            if count + 1 < nums.count {
                top.right = TreeNode(val: nums[count + 1])
                queue.append(top.right!)
            }
            count += 2
        }
        return root
    }
    
}

class Solution {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        let node = TreeNode(val: root.val)
        node.right = mirrorTree(root.left)
        node.left = mirrorTree(root.right)
        return node
    }
}

let solution = Solution()
let node = TreeNode.build([4,2,7,1,3,6,9])
node?.traverse()

//
//let root = TreeNode(val: 4)
//
//let mirror = solution.mirrorTree(root)
