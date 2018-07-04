//
//  SubtreeOfAnotherTree.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/7/4.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class SubtreeOfAnotherTree {
  
  func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    guard let s = s else { return false }
    if s.val == t?.val && helper(s, t) { return true }
    return isSubtree(s.left, t) || isSubtree(s.right, t)
  }
  
  func helper(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil && t == nil { return true }
    else if s == nil || t == nil { return false }
    return s!.val == t!.val && helper(s!.left, t!.left) && helper(s!.right, t!.right)
  }
  
  func test() {
    let s = TreeNode(3)
    s.left = TreeNode(4)
    s.right = TreeNode(5)
    s.left?.left = TreeNode(1)
    s.left?.right = TreeNode(2)
    
    let t = TreeNode(4)
    t.left = TreeNode(1)
    t.right = TreeNode(2)
    t.right?.left = TreeNode(1)
    
    print(isSubtree(s, t))
  }
  
}
