//
//  206.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/11.
//

import Foundation

// 206. Reverse Linked List
// https://leetcode.com/problems/reverse-linked-list/description/
class Leetcode206 {
  func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil, next = head
    while next != nil {
      let temp = next?.next
      next?.next = prev
      prev = next
      next = temp
    }
    return prev
  }
}
