//
//  LinkedListCycleII.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/6.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LinkedListCycleII {
  
  func detectCycle(_ head: ListNode?) -> ListNode? {
    guard head != nil else { return head }
    var slow = head
    var fast = head
    
    var hasCycle = false
    while slow?.next != nil && fast?.next?.next != nil {
      slow = slow?.next
      fast = fast?.next?.next
      
      if slow === fast {
        hasCycle = true
        break
      }
    }
    if !hasCycle {
      return nil
    }
    
    slow = head
    while slow !== fast {
      slow = slow?.next
      fast = fast?.next
    }
    return slow
  }
  
}
