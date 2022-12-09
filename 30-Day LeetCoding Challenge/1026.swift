//
//  1026.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/9.
//

import Foundation

class Leetcode1026 {
  
  func dfs(_ root: TreeNode?, maxValue: Int, minValue: Int, result: inout Int) {
    guard let root = root else { return }
    let temp = max(abs(maxValue - root.val), abs(minValue - root.val))
    result = max(temp, result)

    let maxValue = max(root.val, maxValue)
    let minValue = min(root.val, minValue)
    
    dfs(root.left, maxValue: maxValue, minValue: minValue, result: &result)
    dfs(root.right, maxValue: maxValue, minValue: minValue, result: &result)
  }
  
  func maxAncestorDiff(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var res: Int = 0
    dfs(root, maxValue: root.val, minValue: root.val, result: &res)
    return res
  }
}
