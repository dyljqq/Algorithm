//
//  872.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/8.
//

import Foundation

class Leetcode872 {
  
  func findLeafs(_ root: TreeNode?, rs: inout [Int]) {
    guard let root = root else { return }
    if root.left == nil && root.right == nil {
      rs.append(root.val)
    }
    findLeafs(root.left, rs: &rs)
    findLeafs(root.right, rs: &rs)
  }
  
  func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    var rs1: [Int] = [], rs2: [Int] = []
    findLeafs(root1, rs: &rs1)
    findLeafs(root2, rs: &rs2)
    return rs1 == rs2
  }
}
