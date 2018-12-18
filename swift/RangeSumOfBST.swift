//
//  RangeSumOfBST.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/12/18.
//  Copyright © 2018 dyljqq. All rights reserved.
//

import Foundation

/**
 解题报告:
 题目: Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).
 题目大意: 从一颗搜索二叉树中，找到所有满足值在区间[L, R]中的节点，并输出他们的值。
 **/
class RangeSumOfBST {
  func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
    guard let root = root else { return 0 }
    
    var res = 0
    if (root.val >= L && root.val <= R) {
      res += root.val
      res += rangeSumBST(root.left, L, R)
      res += rangeSumBST(root.right, L, R)
    } else if (root.val < L) {
      res += rangeSumBST(root.right, L, R)
    } else {
      res += rangeSumBST(root.left, L, R)
    }
    return res
  }
}
