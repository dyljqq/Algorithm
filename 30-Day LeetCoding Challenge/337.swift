//
//  337.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/5.
//

import Foundation

class Leetcode337 {
    
    func helper(_ root: TreeNode?) -> (Int, Int, Int) {
        guard let root = root else {
            return (0, 0, 0)
        }
        let (l, ll, lr) = helper(root.left)
        let (r, rl, rr) = helper(root.right)
        return (max(l + r, ll + lr + rl + rr + root.val), l, r)
    }
    
    func rob(_ root: TreeNode?) -> Int {
        return helper(root).0
    }
    
    func test() {
        let root = TreeNode.buildTree([3,2,3,Int.min,3,Int.min,1])
        print(rob(root))
    }
}
