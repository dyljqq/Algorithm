//
//  BinaryTreeNodes.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/30.
//

import Foundation

class BinaryTreeNodes {
    
    var stack: [String] = []
    
    func helper(_ root: TreeNode?, _ path: String) {
        guard let root = root else {
            return
        }
        if root.left == nil && root.right == nil {
            stack.append(path + String(root.val))
            return
        }
        let _ = helper(root.left, "\(path)\(root.val)->")
        let _ = helper(root.right, "\(path)\(root.val)->")
    }
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        helper(root, "")
        return stack
    }
    
}
