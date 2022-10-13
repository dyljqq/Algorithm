//
//  237.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/13.
//

import Foundation

class Leetcode237 {
  func deleteNode(_ node: ListNode?) {
    guard let p = node?.next else { return }
    node?.val = p.val
    node?.next = p.next
  }
}
