//
//  SumRootToLeafNumbers.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/3.
//

import Foundation

class SumRootToLeafNumbers {
    
    var sum = 0
    
    func helper(_ root: TreeNode?, _ currentValue: Int) {
        guard let root = root else {
            return
        }
        let currentValue = currentValue * 10 + root.val
        if root.left == nil && root.right == nil {
            sum += currentValue
            return
        }
        helper(root.left, currentValue)
        helper(root.right, currentValue)
    }
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        helper(root, 0)
        return sum
    }
    
}
