//
//  KthSmallestElement.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/2/18.
//

import Foundation


class KthSmallestElement {
    
    func helper(_ node: TreeNode?, _ k: Int, _ state: inout [Int]) {
        guard let node = node else {
            return
        }
        
        helper(node.left, k, &state)
        state[0] = state[0] + 1
        if state[0] == k {
            state[1] = node.val
            return
        }
        helper(node.right, k, &state)
        
    }
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var state = [0, 0]
        helper(root, k, &state)
        return state[1]
    }
    
    func test() {
        
        var root = TreeNode(val: 5)
        root.left = TreeNode(val: 3)
        root.left?.left = TreeNode(val: 2)
        root.left?.left?.left = TreeNode(val: 1)
        root.left?.right = TreeNode(val: 4)
        root.right = TreeNode(val: 6)
        
        print(kthSmallest(root, 3))
        
    }
    
}
