//
//  ConstructBinaryTree.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/19.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

/**
 105. Construct Binary Tree from Preorder and Inorder Traversal
 */
class ConstructBinaryTree {
  
  func helper(_ p: Int, _ q: Int, _ li: Int, _ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard li < preorder.count && p < q else {
      return nil
    }
    let val = preorder[li]
    let root = TreeNode(val)
    guard let pos = inorder.index(of: val) else { return nil }
    
    root.left = helper(p, pos, li + 1, preorder, inorder)
    root.right = helper(pos + 1, q, li + 1 + pos - p, preorder, inorder)
    return root
  }
  
  func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard !(preorder.isEmpty || inorder.isEmpty) else { return nil }
    return helper(0, preorder.count, 0, preorder, inorder)
  }
  
  func test() {
//    let root = buildTree([3,9,20,15,7], [9,3,15,20,7])
    TreeNode.traverse(buildTree([1, 2, 3], [3, 2, 1]))
  }
  
}
