//
//  2415.swift
//  Leetcode
//
//  Created by polaris dev on 2024/12/20.
//

import Foundation

class Solution2415 {
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        var nodes: [TreeNode] = []
        var level = 0
        nodes.append(root)
        
        while !nodes.isEmpty {
            level += 1
            var temp: [TreeNode] = []
            if level % 2 == 1 {
                for node in nodes {
                    if let left = node.left {
                        temp.append(left)
                    }
                    if let right = node.right {
                        temp.append(right)
                    }
                }
                let nums = Array(temp.map { $0.val }.reversed())
                for (index, node) in temp.enumerated() {
                    node.val = nums[index]
                }
            } else {
                for node in nodes {
                    if let left = node.left {
                        temp.append(left)
                    }
                    if let right = node.right {
                        temp.append(right)
                    }
                }
            }
            nodes = temp
        }
        return root
    }
}
