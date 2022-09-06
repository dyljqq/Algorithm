//
//  814.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/6.
//

import Foundation

class Leetcode814 {
  
  func pruneTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
      return nil
    }

    root.left = pruneTree(root.left)
    root.right = pruneTree(root.right)
    
    return root.val == 1 || root.left != nil || root.right != nil ? root : nil
  }
  
}
