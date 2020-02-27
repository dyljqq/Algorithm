//
//  PalindromeLinkedList.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/2/27.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class PalidromeLinkedList {
  
//  class DoubleListNode {
//
//    var val: Int
//    var pre: DoubleListNode?
//    var next: DoubleListNode?
//
//    init(_ val: Int) {
//      self.val = val
//    }
//
//    static func convert(_ node: ListNode?) -> DoubleListNode? {
//      guard let node = node else { return nil }
//      let dNode = DoubleListNode(node.val)
//      if let next = node.next {
//        let d = DoubleListNode(next.val)
//        dNode.next = d
//      }
//      return dNode
//    }
//
//  }
//
//  func isPalindrome(_ head: ListNode?) -> Bool {
//    guard let head = head else {
//      return true
//    }
//    var pre: ListNode = head
//    var dPre: DoubleListNode? = DoubleListNode.convert(pre)
//    while let next = pre.next {
//      let nNode = DoubleListNode.convert(next)
//      nNode?.pre = dPre
//
//      pre = next
//      dPre = nNode
//    }
//
//    var h: ListNode? = head
//    while h != nil {
//
//      if let h = h,
//         let pre = dPre,
//         h.val != pre.val  {
//        return false
//      }
//
//      h = h?.next
//      dPre = dPre?.pre
//    }
//
//    return true
//  }
  
  func isPalindrome(_ head: ListNode?) -> Bool {
    guard let head = head else {
      return true
    }
    
    var slow: ListNode? = head
    var fast: ListNode? = head
    
    while fast != nil && fast?.next != nil {
      slow = slow?.next
      fast = fast?.next?.next
    }
    
    if fast != nil {
      slow = slow?.next
    }
    
    fast = head
    var pre = reverse(slow)
    while pre != nil {
      if pre?.val != fast?.val {
        return false
      }
      pre = pre?.next
      fast = fast?.next
    }
    
    return true
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
//    print(isPalindrome(config([1, 2])))
    print(isPalindrome(config([1, 2, 2, 1])))
  }
  
  func config(_ arr: [Int]) -> ListNode? {
    if arr.isEmpty {
      return nil
    }
    var node: ListNode? = ListNode(arr[0])
    let root: ListNode? = node
    for i in 1..<arr.count {
      node?.next = ListNode(arr[i])
      node = node?.next
    }
    return root
  }
}
