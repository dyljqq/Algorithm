//
//  ConvertBSTToGreaterTree.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/7/1.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class ConvertBSTToGreaterTree {
  
  func convertBST(_ root: TreeNode?) -> TreeNode? {
    var sum = 0
    helper(root, &sum)
    return root
  }
  
  func helper(_ root: TreeNode?, _ sum: inout Int) {
    guard let root = root else { return }
    helper(root.right, &sum)
    root.val += sum
    sum = root.val
    helper(root.left, &sum)
  }
  
  func test() {
    let t = TreeNode(5)
    t.left = TreeNode(2)
    t.right = TreeNode(13)
    
    let r = convertBST(t)
    TreeNode.traverse(r)
  }
  
}
