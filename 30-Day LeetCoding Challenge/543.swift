//
//  543.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/27.
//

import Foundation

class Solution543 {
    func helper(_ root: TreeNode?, _ res: inout Int) -> Int {
        guard let root else { return 0 }
        let left = helper(root.left, &res)
        let right = helper(root.right, &res)
        res = max(res, left + right)
        return max(left, right) + 1
    }
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var res = 0
        helper(root, &res)
        return res
    }
}
