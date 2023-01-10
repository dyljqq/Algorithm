//
//  100.swift
//  Leetcode
//
//  Created by polaris dev on 2023/1/10.
//

import Foundation

class Leetcode100 {
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q else { return p == nil && q == nil }
        return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}
