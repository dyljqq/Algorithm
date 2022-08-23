//
//  234.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/23.
//

import Foundation

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Leetcode234 {
  
  func isPalindrome(_ head: ListNode?) -> Bool {
    var slow = head, fast = head
    while let f = fast, let ff = f.next {
      fast = ff.next
      slow = slow?.next
    }
    
    if fast != nil {
      slow = slow?.next
    }
    
    slow = reverse(slow)
    var node = head
    while let n = node, let s = slow, n.val == s.val {
      slow = slow?.next
      node = node?.next
    }
    
    return slow == nil
  }
  
  func reverse(_ node: ListNode?) -> ListNode? {
    var head = node
    var pre: ListNode? = nil

    while head != nil {
      let next = head?.next
      head?.next = pre
      pre = head
      head = next
    }

    return pre
  }
  
  func test() {
    
  }
  
}
