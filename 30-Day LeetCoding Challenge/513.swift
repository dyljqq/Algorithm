//
//  513.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/28.
//

import Foundation

class Solution513 {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var queue: [TreeNode] = [root]
        var res = 0
        while !queue.isEmpty {
            let last = queue.removeFirst()
            if let right = last.right {
                queue.append(right)
            }
            if let left = last.left {
                queue.append(left)
            }
            res = last.val
        }
        return res
    }
}
