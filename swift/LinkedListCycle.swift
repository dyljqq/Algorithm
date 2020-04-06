//
//  LinkedListCycle.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/6.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LinkedListCycle {
  
  func hasCycle(_ head: ListNode?) -> Bool {
    guard head != nil else { return false }
    var slow = head
    var fast = head
    
    while slow != nil && fast?.next?.next != nil {
      slow = slow?.next
      fast = fast?.next?.next
      if fast!.val == slow!.val {
        return true
      }
    }
    return false
  }
  
}
