//
//  94.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/8.
//

import Foundation

class Leetcode94 {
  
  func helper(_ root: TreeNode?, _ rs: inout [Int]) {
    guard let root = root else {
      return
    }
    rs.append(root.val)
    helper(root.left, &rs)
    helper(root.right, &rs)
  }
  
  func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var rs: [Int] = []
    helper(root, &rs)
    return rs
  }
  
}
