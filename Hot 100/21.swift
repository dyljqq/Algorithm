//
//  21.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/21.
//

import Foundation

class Leetcode21 {
  
  func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    guard list1 != nil && list2 != nil else {
      return list1 != nil ? list1 : list2
    }
    
    let head = ListNode(-1)
    var p: ListNode? = head, list1 = list1, list2 = list2
    while list1 != nil || list2 != nil {
      if list1 == nil {
        p?.next = list2
        list2 = list2?.next
      } else if list2 == nil {
        p?.next = list1
        list1 = list1?.next
      } else {
        if list1!.val > list2!.val {
          p?.next = list2
          list2 = list2?.next
        } else {
          p?.next = list1
          list1 = list1?.next
        }
      }
      p = p?.next
    }
    return head.next
  }
  
  func test() {
//    print(mergeTwoLists(ListNode.construct([1, 2, 4]), ListNode.construct([1, 3, 4]))?.traverse())
    print(mergeTwoLists(ListNode.construct([-9, 3]), ListNode.construct([5, 7]))?.traverse())
  }
  
}
