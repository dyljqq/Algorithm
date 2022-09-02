//
//  637.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/2.
//

import Foundation

class Leetcode637 {
  
  func averageOfLevels(_ root: TreeNode?) -> [Double] {
    var stack: [TreeNode?] = [root]
    var rs: [Double] = []
    while !stack.isEmpty {
      var sum = 0
      var ss: [TreeNode?] = []
      for node in stack {
        sum += node?.val ?? 0
        if node?.left != nil {
          ss.append(node?.left)
        }
        if node?.right != nil {
          ss.append(node?.right)
        }
      }
      rs.append(Double(sum) / Double(stack.count))
      stack = ss
    }
    return rs
  }
  
}
