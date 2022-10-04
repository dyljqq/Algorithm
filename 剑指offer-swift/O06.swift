//
//  O06.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/4.
//

import Foundation

class LeetcodeO06 {
  
  func reversePrint(_ head: ListNode?) -> [Int] {
    var p = head, arr: [Int] = []
    while p != nil {
      arr.append(p!.val)
      p = p?.next
    }
    return arr.reversed()
  }
  
}
