//
//  563.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/8.
//

import Foundation

/// 563. Binary Tree Tilt
/// https://leetcode.com/problems/binary-tree-tilt/submissions/
class leetcode563 {
    func helper(_ root: TreeNode?, _ sum: inout Int) -> Int {
        guard let root = root else {
            return 0
        }
        let left = helper(root.left, &sum)
        let right = helper(root.right, &sum)
        sum += abs(left - right)
        return left + right + root.val
    }
    
    func findTilt(_ root: TreeNode?) -> Int {
        var sum = 0
        let _ = helper(root, &sum)
        return sum
    }
    
    func test() {
        let rs = [[21,7,14,1,1,2,2,3,3], [4,2,9,3,5,Int.min,7], [1, 2, 3]]
        for r in rs {
            let root = TreeNode.buildTree(r)
            print(findTilt(root))
        }
    }
}
