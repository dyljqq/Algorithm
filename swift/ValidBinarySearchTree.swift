//
//  ValidBinarySearchTree.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/16.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class ValidBinarySearchTree {
  
  func isValid(_ root: TreeNode?, _ mn: Int, _ mx: Int) -> Bool {
    guard let root = root else { return true }
    if root.val <= mn || root.val >= mx {
      return false
    }
    return isValid(root.left, mn, root.val) && isValid(root.right, root.val, mx)
  }
  
  func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    return isValid(root, Int.min, Int.max)
  }
  
  func test() {
    var root = TreeNode(10)
    root.left = TreeNode(5)
    root.right = TreeNode(15)
    root.right?.left = TreeNode(6)
    root.right?.right = TreeNode(20)
    print(isValidBST(root))
  }
  
}
