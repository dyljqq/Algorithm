//
//  1448.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/1.
//

import Foundation

class Leetcode1448 {
  
  var count = 0
  
  func dfs(_ root: TreeNode?, _ maxNodeValue: Int) {
    guard let root = root else {
      return
    }
    
    if root.val >= maxNodeValue {
      count += 1
    }
    
    let mx = max(maxNodeValue, root.val)
    dfs(root.left, mx)
    dfs(root.right, mx)
  }
  
  func goodNodes(_ root: TreeNode?) -> Int {
    guard let root = root else {
      return 0
    }
    dfs(root, Int.min)
    return count
  }
  
}
