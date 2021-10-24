//
//  CountCompleteTreeNodes.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/24.
//

import Foundation

class CountCompleteTreeNodes {
    
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var total = 1
        var stack = [root]
        while !stack.isEmpty {
            var nodes = [TreeNode]()
            for node in stack {
                if let left = node.left {
                    nodes.append(left)
                }
                if let right = node.right {
                    nodes.append(right)
                }
            }
            stack = nodes
            total += nodes.count
        }
        return total
    }
    
}
