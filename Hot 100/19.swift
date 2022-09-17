//
//  19.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/17.
//

import Foundation

class Leetcode19 {
  
  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let pre: ListNode? = ListNode(-1)
    pre?.next = head
    var slow = pre, quick = pre, count = n
    while count > 0 {
      quick = quick?.next
      count -= 1
    }
    
    while quick?.next != nil {
      slow = slow?.next
      quick = quick?.next
    }
    
    slow?.next = slow?.next?.next
    return pre?.next
  }
  
  func test() {
    removeNthFromEnd(ListNode.construct([1,2,3,4,5]), 2)?.traverse()
    removeNthFromEnd(ListNode.construct([1]), 1)?.traverse()
    removeNthFromEnd(ListNode.construct([1,2]), 1)?.traverse()
  }
}
