//
//  DSolution8.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/9.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class DSolution8 {
  
  func middleNode(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    while slow != nil && fast != nil && fast?.next != nil {
      slow = slow?.next
      fast = fast?.next?.next
    }
    return slow
  }
  
}
