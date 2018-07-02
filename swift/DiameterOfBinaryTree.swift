//
//  DiameterOfBinaryTree.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/7/2.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class DiameterOfBinaryTree {
  
  func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    let l = helper(root.left)
    let r = helper(root.right)
    return max(l + r, max(diameterOfBinaryTree(root.left), diameterOfBinaryTree(root.right)))
  }
  
  func helper(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return 1 + max(helper(root.left), helper(root.right))
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
