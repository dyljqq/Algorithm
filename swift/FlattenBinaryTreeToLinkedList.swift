//
//  FlattenBinaryTreeToLinkedList.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/18.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class FlattenBinaryTreeToLinkedList {
  
//  func helper(_ root: TreeNode?, _ stack: inout [Int]) {
//    guard let root = root else { return }
//    stack.append(root.val)
//    helper(root.left, &stack)
//    helper(root.right, &stack)
//  }
//
//  func flatten(_ root: TreeNode?) {
//    guard let root = root else { return }
//    var stack: [Int] = []
//    helper(root, &stack)
//
//    var temp: TreeNode? = root
//    for i in 1..<stack.count {
//      temp?.left = nil
//      temp?.right = TreeNode(stack[i])
//      temp = temp?.right
//    }
//  }
  
  var prev: TreeNode?
  
  func flatten(_ root: TreeNode?) {
    guard let root = root else { return }
    flatten(root.right)
    flatten(root.left)
    root.right = prev
    root.left = nil
    prev = root
  }
  
  func test() {
    var root = TreeNode(1)
    root.left = TreeNode(2)
    root.right = TreeNode(5)
    root.left?.left = TreeNode(3)
    root.left?.right = TreeNode(4)
    root.right?.right = TreeNode(6)
    flatten(root)
  }
  
}
