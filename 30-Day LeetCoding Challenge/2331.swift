//
//  2331.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/16.
//

import Foundation

class Solution2331 {
    func evaluateTree(_ root: TreeNode?) -> Bool {
        guard let root else { return false }
        if root.left == nil, root.right == nil {
            return root.val == 1 ? true : false
        }
        let left = evaluateTree(root.left)
        let right = evaluateTree(root.right)
        if root.val == 2 {
            return left || right
        } else if root.val == 3 {
            return left && right
        }
        return false
    }
}
