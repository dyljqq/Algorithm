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
    
    let l3 = ListNode(0)
    var v3 = l3
    
    while let v1 = l1, let v2 = l2 {
      if v1.val > v2.val {
        v3.next = ListNode(v2.val)
        v3 = v3.next!
        l2 = v2.next
      } else {
        v3.next = ListNode(v1.val)
        v3 = v3.next!
        l1 = v1.next
      }
    }
    
    if let _ = l1 {
      v3.next = l1
    }
    
    if let _ = l2 {
      v3.next = l2
    }
    
    return l3.next
  }
  
  func test() {
    let l1 = create(vals: [1, 4, 5, 7, 9, 11, 15, 17, 20])
    let l2 = create(vals: [1, 3, 4, 10])
    let l3 = mergeTwoLists(l1, l2)
    
//    printList(l: l1)
//    printList(l: l2)
    printList(l: l3)
    
  }
  
  private func printList(l: ListNode?) {
    var l = l
    while let v = l {
      print(v.val)
      l = v.next
    }
  }
  
  private func create(vals: [Int]) -> ListNode? {
    guard vals.count > 0 else { return nil }
    let list = ListNode(0)
    var l = list
    for val in vals {
      l.next = ListNode(val)
      l = l.next!
    }
    return list.next
  }
  
}
