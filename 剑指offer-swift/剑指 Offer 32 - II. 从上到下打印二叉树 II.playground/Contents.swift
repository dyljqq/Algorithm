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
    
    static func build(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else {
            return nil
        }
        
        let root = TreeNode(val: nums.first!)
        var queue: [TreeNode] = [root]
        
        var count = 1
        while !queue.isEmpty && count < nums.count {
            let top = queue.removeFirst()
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
    
    func traverse() {
        print(self.val)
        self.left?.traverse()
        self.right?.traverse()
    }
    
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var queue: [[TreeNode]] = []
        queue.append([root])
        while !queue.last!.isEmpty {
            var tmps = [TreeNode]()
            for node in queue.last! {
                if let left = node.left {
                    tmps.append(left)
                }
                if let right = node.right {
                    tmps.append(right)
                }
            }
            queue.append(tmps)
        }
        
        return queue.dropLast().map { $0.map { $0.val } }
    }
}

let solution = Solution()
// [3,9,20,null,null,15,7]
let root = TreeNode(val: 3)
root.left = TreeNode(val: 9)
root.right = TreeNode(val: 20)
root.right?.left = TreeNode(val: 15)
root.right?.right = TreeNode(val: 7)
print(solution.levelOrder(root))
