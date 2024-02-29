//
//  1609.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/29.
//

import Foundation

class Solution1609 {
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        guard let root else { return false }
        var nodes: [TreeNode] = [root]
        
        var index = 0
        while !nodes.isEmpty {
            var temps: [TreeNode] = []
            let preNode = nodes.removeFirst()
            if index % 2 == 0 {
                if preNode.val % 2 == 0 {
                    return false
                }
            } else {
                if  preNode.val % 2 == 1 {
                    return false
                }
            }
            if let left = preNode.left {
                temps.append(left)
            }
            if let right = preNode.right {
                temps.append(right)
            }
            var pre = preNode.val
            for node in nodes {
                if index % 2 == 0 {
                    if node.val % 2 == 0 || pre >= node.val {
                        return false
                    }
                } else {
                    if  node.val % 2 == 1 || pre <= node.val {
                        return false
                    }
                }
                if let left = node.left {
                    temps.append(left)
                }
                if let right = node.right {
                    temps.append(right)
                }
                pre = node.val
            }
            nodes = temps
            index += 1
        }
        return true
    }
    
    func test() {
        var root = TreeNode(1)
        root.left = TreeNode(10)
        root.right = TreeNode(4)
        root.left?.left = TreeNode(3)
        root.right?.left = TreeNode(7)
        root.right?.right = TreeNode(9)
        root.left?.left?.left = TreeNode(12)
        root.left?.left?.right = TreeNode(8)
        root.right?.left?.left = TreeNode(6)
        root.right?.right?.right = TreeNode(2)
        print(isEvenOddTree(root))
    }
}
