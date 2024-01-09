//
//  872.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/9.
//

import Foundation

class Solution872 {
    
    func fetchLeaves(on root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        var values: [Int] = []
        values += fetchLeaves(on: root.left)
        if root.left == nil && root.right == nil {
            values.append(root.val)
        }
        values += fetchLeaves(on: root.right)
        return values
    }
    
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        let v1 = fetchLeaves(on: root1)
        let v2 = fetchLeaves(on: root2)
        return v1 == v2
    }
}
