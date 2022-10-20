//
//  C98.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/20.
//

import Foundation

class LeetcodeC98 {
  
  var pre = Int.min
  
  func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    
    if !isValidBST(root.left) || root.val <= pre {
      return false
    }
    pre = root.val
    return isValidBST(root.right)
  }
  
}
