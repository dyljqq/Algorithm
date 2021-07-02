//
//  LowestCommonAncestorOfABinaryTree.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/2.
//

import Foundation

/**
  236.  Lowest Common Ancestor of a Binary Tree (https://leetcode.com/explore/challenge/card/june-leetcoding-challenge-2021/607/week-5-june-29th-june-30th/3797/)
 */

class LowestCommonAncestorOfABinaryTree {
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || root?.val == p?.val || root?.val == q?.val {
            return root
        }
        
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        
        if left != nil && right != nil {
            return root
        }
        
        return left != nil ? left : right
        
    }
    
    func test() {
        
        let root = TreeNode(val: 100)
        root.left = TreeNode(val: 5)
        root.left?.left = TreeNode(val: 6)
        root.left?.right = TreeNode(val: 2)
        root.left?.right?.left = TreeNode(val: 7)
        root.left?.right?.right = TreeNode(val: 4)
        root.right = TreeNode(val: 1)
        root.right?.left = TreeNode(val: 0)
        root.right?.right = TreeNode(val: 8)
        
        print(lowestCommonAncestor(root, root.left?.right?.left, root.right?.left))
        
    }
    
}
