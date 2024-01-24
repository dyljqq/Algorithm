//
//  1457.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/24.
//

import Foundation

class Solution1457 {
    
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        return self.dfs(root, 0)
    }
    
    private func dfs(_ node: TreeNode?, _ freq: Int) -> Int {
        guard let node = node else { return 0 }
        var freq = freq
        freq ^= (1 << node.val)
        let ret = (node.left == nil && node.right == nil && freq & (freq - 1) == 0) ? 1 : 0
        let retLeft = dfs(node.left, freq)
        let retRight = dfs(node.right, freq)
        return ret + retLeft + retRight
    }
    
    func test() {
        // [2,3,1,3,1,null,1]
        var root = TreeNode(2)
        root.left = TreeNode(3)
        root.right = TreeNode(1)
        root.left?.left = TreeNode(3)
        root.left?.right = TreeNode(1)
        root.right?.right = TreeNode(1)
        
        print(pseudoPalindromicPaths(root))
    }
}
