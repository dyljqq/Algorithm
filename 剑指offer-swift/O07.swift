//
//  O07.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/5.
//

import Foundation

class LeetcodeO07 {
  
  func helper(_ pre: [Int], preL: Int, preR: Int, inL: Int, hash: [Int: Int]) -> TreeNode? {
    guard preL <= preR else {
      return nil
    }
    
    let val = pre[preL]
    let inRoot = hash[val]!
    let leftTreeSize = inRoot - inL
    let root = TreeNode(val)
    root.left = helper(pre, preL: preL + 1, preR: preL + leftTreeSize, inL: inL, hash: hash)
    root.right = helper(pre, preL: preL + leftTreeSize + 1, preR: preR, inL: inL + leftTreeSize + 1, hash: hash)
    return root
  }
  
  func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    var hash: [Int: Int] = [:]
    inorder.enumerated().forEach { hash[$1] = $0 }
    return helper(preorder, preL: 0, preR: preorder.count - 1, inL: 0, hash: hash)
  }
  
}
