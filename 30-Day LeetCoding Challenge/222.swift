//
//  222.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/15.
//

import Foundation

// 222. Count Complete Tree Nodes
// https://leetcode.com/problems/count-complete-tree-nodes/
class Leetcode222 {
  func countNodes(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var total = 1
    var queue: [TreeNode] = [root]
    while !queue.isEmpty {
      var temp: [TreeNode] = []
      for node in queue {
        if let left = node.left {
          temp.append(left)
        }
        if let right = node.right {
          temp.append(right)
        }
      }
      total += temp.count
      queue = temp
    }
    return total
  }
}
