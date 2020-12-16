//
//  binaryTreeMaximumPathSum.swift
//  Leetcode
//
//  Created by 季勤强 on 2020/12/16.
//

import Foundation

/*
 Binary Tree Maximum Path Sum
 https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/532/week-5/3314/
 */
class BinaryTreeMaximumPathSum {
    
    var ans = Int.min
    
    func helper(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let left = max(0, helper(root.left))
        let right = max(0, helper(root.right))
        let sum = left + right + root.val
        ans = max(ans, sum)
        return max(left, right) + root.val
    }
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        let _ = helper(root)
        return ans
    }
    
}
