//
//  LowestCommonAncestorOfABinaryTree.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/30.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LowestCommonAncestorOfABinaryTree {
  
  func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    if root.val == p!.val || root.val == q!.val {
      return root
    }
    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)
    
    if left != nil && right != nil {
      return root
    }
    return left != nil ? left : right
  }
  
}
