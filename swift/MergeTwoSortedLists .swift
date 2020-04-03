//
//  MergeTwoSorted Lists .swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/9.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class MergeTwoSortedLists  {
  
  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    let l: ListNode? = ListNode(0)
    var temp = l
    
    while l1 != nil && l2 != nil {
      if l1!.val < l2!.val {
        temp?.next = l1
        l1 = l1?.next
      } else {
        temp?.next = l2
        l2 = l2?.next
      }
      temp = temp?.next
    }
    temp?.next = l1 != nil ? l1 : l2
    return l?.next
  }
  
  func test() {
    let l1 = ListNode.generate( [1, 4, 5, 7, 9, 11, 15, 17, 20])
    let l2 = ListNode.generate([1, 3, 4, 10])
    let l3 = mergeTwoLists(l1, l2)
    l3.traverse()
  }
  
}
