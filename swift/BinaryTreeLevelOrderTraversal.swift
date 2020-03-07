//
//  BinaryTreeLevelOrderTraversal.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/7.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class BinaryTreeLevelOrderTraversal {
  func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var nums: [[Int]] = []
    var nodes: [TreeNode?] = [root]
    while !nodes.isEmpty {
      var arr: [Int] = []
      var newNodes: [TreeNode?] = []
      for node in nodes {
        if let n = node {
          arr.append(n.val)
          newNodes.append(n.left)
          newNodes.append(n.right)
        }
      }
      
      if !arr.isEmpty {
        nums.append(arr)
      }
      nodes = newNodes
    }
    return nums
  }
  
  func test() {
    
  }
}
