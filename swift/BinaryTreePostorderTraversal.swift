//
//  BinaryTreePostorderTraversal.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/9/24.
//

import Foundation

class BinaryTreePostorderTraversal {
    
//    var rs: [Int] = []
//
//    func helper(_ root: TreeNode?) {
//        guard let root = root else {
//            return
//        }
//        helper(root.left)
//        helper(root.right)
//        rs.append(root.val)
//    }
//
//    func postorderTraversal(_ root: TreeNode?) -> [Int] {
//        helper(root)
//        return rs
//    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = [], stack: [TreeNode] = []
        var cur = root, pre = root
        
        while !stack.isEmpty || cur != nil {
            while cur != nil {
                stack.append(cur!)
                cur = cur!.left
            }
            
            if let last = stack.last {
                cur = last
                if cur?.right == nil || pre === cur?.right {
                    res.append(cur!.val)
                    pre = cur
                    cur = nil
                    stack.removeLast()
                } else {
                    cur = cur?.right
                }
            }
            
        }
        
        return res
    }
    
    func test() {
        var root = TreeNode(1)
        root.right = TreeNode(2)
        root.right?.left = TreeNode(3)
        print(postorderTraversal(root))
    }
    
}
