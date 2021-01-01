//
//  CousinsinBinaryTree.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/1/1.
//

import Foundation

class CousinsinBinaryTree {
    
    var arr: Array<(Int, TreeNode?)> = Array(repeating: (-1, nil), count: 101)
    
    func helper(_ root: TreeNode?, depth: Int, parent: TreeNode?) {
        guard let root = root else {
            return
        }
        
        arr[root.val] = (depth, parent)
        helper(root.left, depth: depth + 1, parent: root)
        helper(root.right, depth: depth + 1, parent: root)
    }
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else {
            return false
        }
        helper(root, depth: 0, parent: nil)
        return arr[x].0 == arr[y].0 && (arr[x].1?.val != arr[y].1?.val)
    }
    
}
