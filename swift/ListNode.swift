//
//  ListNode.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/9.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class ListNode {
  
  var val: Int
  var next: ListNode?
  
  init(_ val: Int) {
    self.val = val
    self.next = nil
  }
  
  class func generate(_ arr: [Int]) -> ListNode? {
    guard !arr.isEmpty else { return nil }
    let root = ListNode(arr[0])
    var preNode: ListNode? = root
    for i in 1..<arr.count {
      preNode?.next = ListNode(arr[i])
      preNode = preNode?.next
    }
    return root
  }
  
  func traverse() {
    var temp: ListNode? = self
    while temp != nil {
      print(temp!.val)
      temp = temp?.next
    }
  }
  
}
