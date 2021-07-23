import Cocoa

class Solution {
//    func postorderTraversal(_ root: TreeNode?) -> [Int] {
//        guard let root = root else {
//            return []
//        }
//        return postorderTraversal(root.left) + postorderTraversal(root.right) + [root.val]
//    }
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard  root != nil  else { return []  }

        var result = [Int]()
        var stack = [TreeNode]()
        var lastVisit : TreeNode?    // 通过lastVisit标识右子节点是否已经弹出

        var cur = root
        while cur != nil || stack.count != 0 {
            while cur != nil {
                stack.append(cur!)
                cur = cur!.left
            }

            let top = stack.last!//这里先看看，先不弹出
            if top.right == nil || top.right === lastVisit {//根节点必须在右节点弹出之后，再弹出
                let node = stack.removeLast()
                result.append(node.val)
                lastVisit = node// 标记当前这个节点已经弹出过
            }else{
                cur = top.right
            }
        }
        return result
    }
}

let root = TreeNode(val: 1)
root.right = TreeNode(val: 2)
root.right?.left = TreeNode(val: 3)
let solution = Solution()
print(solution.postorderTraversal(root))
