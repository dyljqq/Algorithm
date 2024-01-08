//
//  938.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/8.
//

import Foundation

class Solution938 {
    
    func dfs(_ root: TreeNode?, _ low: Int, _ high: Int, sum: inout Int) {
        guard let root else { return }
        let val = root.val
        if val >= low, val <= high {
            sum += val
            dfs(root.left, low, high, sum: &sum)
            dfs(root.right, low, high, sum: &sum)
        } else if val < low {
            dfs(root.right, low, high, sum: &sum)
        } else {
            dfs(root.left, low, high, sum: &sum)
        }
    }
    
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        dfs(root, low, high, sum: &sum)
        return sum
    }
}
