import UIKit

/**
 一个很玄学的问题，leetcode的判定系统感觉有点问题。
 minDepth的执行时间竟然比minDepth2快。。。我服了
 */
class MinimumDepthOfBinaryTree {
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        if root.left == nil && root.right == nil {
            return 1
        }

        let left = root.left != nil ? minDepth(root.left) : Int.max
        let right = root.right != nil ? minDepth(root.right) : Int.max
        return min(left, right) + 1
    }
    
    func minDepth2(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var depth = 0
        var queue: [TreeNode] = [root]
        while !queue.isEmpty {
            depth = depth + 1
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                
                if node.left == nil && node.right == nil {
                    return depth
                }
                
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
        }
        return depth
    }
    
}
