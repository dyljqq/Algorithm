//
//  938.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/7.
//

import Foundation

class Leetcode938 {
  
  var total: Int = 0
  
  func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
    guard let root = root else { return 0 }
    
    if root.val >= low && root.val <= high {
      total += root.val
      rangeSumBST(root.left, low, high)
      rangeSumBST(root.right, low, high)
    } else if root.val < low {
      rangeSumBST(root.right, low, high)
    } else {
      rangeSumBST(root.left, low, high)
    }
    
    return total
  }
}
