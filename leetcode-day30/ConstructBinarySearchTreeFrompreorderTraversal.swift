//
//  ConstructBinarySearchTreeFrompreorderTraversal.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/21.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class ConstructBinarySearchTreeFrompreorderTraversal {
  
  func helper(_ preorder: [Int], _ p: Int, _ q: Int) -> TreeNode? {
    guard p < q else {
      return nil
    }
    let root = TreeNode(preorder[p])
    var m = p
    while m < q && preorder[m] <= root.val {
      m += 1
    }
    root.left = helper(preorder, p + 1, m)
    root.right = helper(preorder, m, q)
    return root
  }
  
  func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
    return helper(preorder, 0, preorder.count)
  }
  
//  func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
//    guard !preorder.isEmpty else {
//      return nil
//    }
//
//    let root = TreeNode(preorder[0])
//    var parent: TreeNode = root
//    var leftNodes: [TreeNode] = [parent]
//    for i in 1..<preorder.count {
//      let val = preorder[i]
//      if val < parent.val {
//        parent.left = TreeNode(val)
//        parent = parent.left!
//      } else {
//        var j = leftNodes.count - 1
//        while j > 0 {
//          if leftNodes[j].val < val && leftNodes[j - 1].val > val {
//            parent = leftNodes[j]
//            break
//          }
//          j = j - 1
//        }
//        if j == 0 {
//          parent = leftNodes.first!
//        }
//        leftNodes.removeSubrange(j..<leftNodes.count)
//        parent.right = TreeNode(val)
//        parent = parent.right!
//      }
//      leftNodes.append(parent)
//    }
//
//    return root
//  }
  
  func test() {
    let root = bstFromPreorder([8,5,1,7,10,12])
    TreeNode.traverse(root)
  }
  
}
