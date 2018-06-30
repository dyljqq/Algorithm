//
//  MergeTwoBinaryTrees.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/30.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class MergeTwoBinaryTrees {
  
  func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    guard let t1 = t1 else { return t2 }
    guard let t2 = t2 else { return t1 }
    let val = t1.val + t2.val
    let t3 = TreeNode(val)
    t3.left = mergeTrees(t1.left, t2.left)
    t3.right = mergeTrees(t1.right, t2.right)
    return t3
  }
  
  func test() {
    let t1 = TreeNode(1)
    t1.left = TreeNode(3)
    t1.right = TreeNode(2)
    t1.left?.left = TreeNode(5)
    
    let t2 = TreeNode(2)
    t2.left = TreeNode(1)
    t2.right = TreeNode(3)
    t2.left?.right = TreeNode(4)
    t2.right?.right = TreeNode(7)
    
    let t3 = mergeTrees(t1, t2)
    handle(t: t3)
  }
  
  func handle(t: TreeNode?) {
    guard let t = t else { return }
    print("t. val: \(t.val)")
    handle(t: t.left)
    handle(t: t.right)
  }
  
}
