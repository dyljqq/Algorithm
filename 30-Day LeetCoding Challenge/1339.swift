//
//  1339.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/10.
//

import Foundation

// 1339. Maximum Product of Splitted Binary Tree
// https://leetcode.com/problems/maximum-product-of-splitted-binary-tree/description/
class Leetcode1339 {
  
  var ans: Int = 0
  
  func sum(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return sum(root.left) + sum(root.right) + root.val
  }
  
  func dfs(_ root: TreeNode?, total: Int) -> Int {
    guard let root = root else { return 0 }
    let left = dfs(root.left, total: total)
    let right = dfs(root.right, total: total)
    ans = max(ans, max(left * (total - left), right * (total - right)))
    return left + right + root.val
  }
  
  func maxProduct(_ root: TreeNode?) -> Int {
    let total = sum(root)
    dfs(root, total: total)
    let mod = Int(pow(10.0, 9) + 7)
    return ans % mod
  }
}
