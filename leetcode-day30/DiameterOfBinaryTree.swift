//
//  DiameterOfBinaryTree.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/11.
//

import Foundation

class DiameterOfBinaryTree {
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var mx = 0
        let _ = longestPath(of: root, &mx)
        return mx
    }
    
    func longestPath(of root: TreeNode?, _ mx: inout Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        let left = longestPath(of: root.left, &mx)
        let right = longestPath(of: root.right, &mx)
        mx = max(mx, left + right)
        return max(left, right) + 1
    }
}
