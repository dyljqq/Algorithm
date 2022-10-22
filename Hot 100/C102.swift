//
//  C102.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/22.
//

import Foundation

class LeetcodeC102 {
  func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var results: [[Int]] = []
    var stack: [TreeNode] = [root]
    while !stack.isEmpty {
      var rs: [Int] = []
      var nodes: [TreeNode] = []
      for node in stack {
        if let left = node.left {
          nodes.append(left)
        }
        if let right = node.right {
          nodes.append(right)
        }
        rs.append(node.val)
      }
      stack = nodes
      results.append(rs)
    }
    return results
  }
  
  func test() {
    let root = TreeNode(3)
    root.left = TreeNode(9)
    root.right = TreeNode(20)
    root.right?.left = TreeNode(15)
    root.right?.right = TreeNode(7)
    print(levelOrder(root))
  }
}
