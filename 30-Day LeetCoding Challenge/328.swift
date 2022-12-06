//
//  328.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/6.
//

import Foundation

class Leetcode328 {
  func oddEvenList(_ head: ListNode?) -> ListNode? {
    var odd = head, even = head?.next, even_head = even
    while even != nil && even?.next != nil {
      odd?.next = even?.next
      odd = odd?.next
      even?.next = odd?.next
      even = even?.next
    }
    odd?.next = even_head
    return head
  }
  
  func test() {
    oddEvenList(ListNode.construct([1,2,3,4,5]))?.traverse()
    print("-------")
    oddEvenList(ListNode.construct([2,1,3,5,6,4,7]))?.traverse()
  }
}
