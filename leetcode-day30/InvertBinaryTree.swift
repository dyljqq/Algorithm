//
//  InvertBinaryTree.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/26.
//

import Foundation

class InvertBinaryTree {
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        let tmp = root.right
        root.right = invertTree(root.left)
        root.left = invertTree(tmp)
        return root;
    }
    
}
