//
//  LowestCommonAncestorOfABinarySearchTree.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/30.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LowestCommonAncestorOfABinarySearchTree {
  
  func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root, let p = p, let q = q else { return nil }
    if p.val < root.val && q.val < root.val {
      return lowestCommonAncestor(root.left, p, q)
    } else if  p.val > root.val && q.val > root.val {
      return lowestCommonAncestor(root.right, p, q)
    } else {
      return root
    }
  }
  
}

