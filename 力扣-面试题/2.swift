//
//  2.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/30.
//

import Foundation

class Leetcode2 {
  
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1, l2 = l2, l3: ListNode? = ListNode(-1), head = l3
    
    var remain = 0
    while l1 != nil || l2 != nil {
      var val = 0
      if l1 != nil {
        val += l1!.val
        l1 = l1?.next
      }
      if l2 != nil {
        val += l2!.val
        l2 = l2?.next
      }
      val += remain
      let node = ListNode(val % 10)
      remain = val >= 10 ? 1 : 0
      l3?.next = node
      l3 = l3?.next
    }
    
    if remain > 0 {
      let node = ListNode(remain)
      l3?.next = node
      l3 = l3?.next
    }
    
    return head?.next
  }
  
  func test() {
    addTwoNumbers(ListNode.construct([2,4,3]), ListNode.construct([5,6,4]))?.traverse()
    print()
    addTwoNumbers(ListNode.construct([0]), ListNode.construct([0]))?.traverse()
    print()
    addTwoNumbers(ListNode.construct([9,9,9,9,9,9,9]), ListNode.construct([9,9,9,9]))?.traverse()
  }
  
}
