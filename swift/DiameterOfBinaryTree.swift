//
//  DiameterOfBinaryTree.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/7/2.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class DiameterOfBinaryTree {
  
  func helper(_ root: TreeNode?) -> (Int, Int) {
    guard let root = root else { return (0, 0) }
    let (leftDepth, leftDiam) = helper(root.left)
    let (rightDepth, rightDiam) = helper(root.right)
    let depth = 1 + max(leftDepth, rightDepth)
    return (depth, max(leftDiam, max(rightDiam, leftDepth + rightDepth)))
  }
  
  func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    guard let root = root else {
      return 0
    }
    let res = helper(root)
    return res.1
  }
  
  func test() {
    let root = TreeNode(1)
    root.left = TreeNode(2)
    root.right = TreeNode(3)
    root.left?.left = TreeNode(4)
    root.left?.right = TreeNode(5)
    
    print("result: \(diameterOfBinaryTree(root))")
  }
  
}
