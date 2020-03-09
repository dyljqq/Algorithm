//
//  HouseRobberThree.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/9.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class HouseRobberThree {
  
  func dfs(_ root: TreeNode?) -> [Int] {
    var res = Array(repeating: 0, count: 2)
    guard let root = root else {
      return res
    }
    let left = dfs(root.left)
    let right = dfs(root.right)
    res[0] = max(left[0], left[1]) + max(right[0], right[1])
    res[1] = root.val + left[0] + right[0]
    return res
  }
  
  func rob(_ root: TreeNode?) -> Int {
    let res = dfs(root)
    return max(res[0], res[1])
  }
  
  func test() {
    
    var root = TreeNode(3)
    root.left = TreeNode(2)
    root.right = TreeNode(3)
    root.left?.right = TreeNode(3)
    root.right?.right = TreeNode(1)
    print(rob(root))
    
    root = TreeNode(4)
    root.left = TreeNode(1)
    root.left?.left = TreeNode(2)
    root.left?.left?.right = TreeNode(3)
    print(rob(root))

    root = TreeNode(2)
    root.left = TreeNode(1)
    root.right = TreeNode(3)
    root.left?.right = TreeNode(4)
    print(rob(root))
    
  }
}
