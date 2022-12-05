//
//  876.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/5.
//

import Foundation

class Leetcode876 {
  
  func middleNode(_ head: ListNode?) -> ListNode? {
    var first = head, second = head
    while second?.next != nil {
      first = first?.next
      second = second?.next?.next
    }
    return first
  }
  
}
