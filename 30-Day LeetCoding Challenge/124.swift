//
//  124.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/11.
//

import Foundation

// 124. Binary Tree Maximum Path Sum
// https://leetcode.com/problems/binary-tree-maximum-path-sum/description/
class Leetcode124 {
  
  func dfs(_ root: TreeNode?, ans: inout Int) -> Int {
    guard let root = root else { return 0 }
    let left = max(0, dfs(root.left, ans: &ans))
    let right = max(0, dfs(root.right, ans: &ans))
    ans = max(ans, left + right + root.val)
    return max(left, right) + root.val
  }
  
  func maxPathSum(_ root: TreeNode?) -> Int {
    var ans = Int.min
    dfs(root, ans: &ans)
    return ans
  }
}
