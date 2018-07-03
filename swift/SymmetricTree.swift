//
//  SymmetricTree.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/7/3.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class SymmetricTree {
  
  func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    return helper(root.left, root.right)
  }
  
  func helper(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
    if t1 == nil && t2 == nil { return true }
    else if t1 == nil || t2 == nil { return false }
    return (t1!.val == t2!.val) && helper(t1!.left, t2!.right) && helper(t1!.right, t2!.left)
  }
  
  func test() {
    let t = TreeNode(1)
    t.left = TreeNode(2)
    t.right = TreeNode(2)
    t.left?.left = TreeNode(3)
//    t.right?.right = TreeNode(4)
    
    print(isSymmetric(t))
  }
}
