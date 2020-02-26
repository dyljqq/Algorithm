//
//  PathSumThree.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/7/5.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class PathSumThree {
  
  func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    guard let root = root else {
      return 0
    }
    return dfs(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
  }
  
  func dfs(_ root: TreeNode?, _ sum: Int) -> Int {
    var res = 0
    guard let root = root else {
      return res
    }
    
    if (root.val == sum) {
      res += 1
    }
    
    res += dfs(root.left, sum - root.val)
    res += dfs(root.right, sum - root.val)
    
    return res
  }
  
}
