//
//  1325.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/17.
//

import Foundation

class Solution1325 {
    
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        guard let root = root else { return nil }
            
        root.left = removeLeafNodes(root.left, target)
        root.right = removeLeafNodes(root.right, target)
        
        if root.val == target && root.left == nil && root.right == nil {
            return nil
        }
        
        return root
    }
    
    func test() {
//        let arr = [1,2,3,2,null,2,4]
        let root = TreeNode(1)
//        [1,3,3,3,2]
        root.left = TreeNode(3)
        root.right = TreeNode(3)
        root.left?.left = TreeNode(3)
        root.left?.right = TreeNode(2)
//        root.right?.right = TreeNode(4)
        let r = removeLeafNodes(root, 3)
        tranverse(r)
    }
}

func tranverse(_ root: TreeNode?) {
    guard let root else { return }
    tranverse(root.left)
    print(root.val)
    tranverse(root.right)
}
