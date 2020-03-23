//
//  MiddleOfTheLinkedList.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/23.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MiddleOfTheLinkedList {
  
  func middleNode(_ head: ListNode?) -> ListNode? {
    var pre: ListNode? = head
    var quick: ListNode? = head
    
    while quick?.next != nil {
      pre = pre?.next
      quick = (quick?.next)?.next
    }
    return pre
  }
  
}
