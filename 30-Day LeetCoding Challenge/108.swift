//
//  108.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/28.
//

import Foundation

class Leetcode108 {
  
  func helper(_ p: Int, _ q: Int, _ nums: [Int]) -> TreeNode? {
    guard p <= q else {
      return nil
    }
    
    let mid = (p + q) / 2
    let root = TreeNode(nums[mid])
    root.left = helper(p, mid - 1, nums)
    root.right = helper(mid + 1, q, nums)
    return root
  }
  
  func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return helper(0, nums.count - 1, nums)
  }
  
}
