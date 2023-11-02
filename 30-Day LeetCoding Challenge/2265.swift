//
//  2265.swift
//  Leetcode
//
//  Created by polaris dev on 2023/11/2.
//

import Foundation

class Solution2265 {
    
    struct Value {
        let num: Int
        let total: Int
    }
    
    private var count = 0
    
    func dfs(_ root: TreeNode?) -> Value? {
        guard let root = root else { return nil }
        let left = dfs(root.left)
        let right = dfs(root.right)
        
        let total = (left?.total ?? 0) + (right?.total ?? 0) + root.val
        let num = (left?.num ?? 0) + (right?.num ?? 0) + 1
        let avg = total / num
        if avg == root.val {
            count += 1
        }
        return Value(num: num, total: total)
    }
    
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        let _ = dfs(root)
        return count
    }
    
    func test() {
        let root = TreeNode(4)
        root.left = TreeNode(8)
        root.right = TreeNode(5)
        root.left?.left = TreeNode(0)
        root.left?.right = TreeNode(1)
        root.right?.right = TreeNode(6)
        
        print(averageOfSubtree(root))
    }
}
