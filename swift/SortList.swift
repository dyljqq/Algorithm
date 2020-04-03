//
//  SortList.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/3.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class SortList {
  
//  func merge(_ a: [Int], _ b: [Int]) -> [Int] {
//    var t1 = 0
//    var t2 = 0
//    var temps: [Int] = []
//    while t1 < a.count && t2 < b.count {
//      if a[t1] < b[t2] {
//        temps.append(a[t1])
//        t1 += 1
//      } else {
//        temps.append(b[t2])
//        t2 += 1
//      }
//    }
//
//    temps.append(contentsOf: a[t1..<a.count])
//    temps.append(contentsOf: b[t2..<b.count])
//    return temps
//  }
//
//  func sort(_ p: Int, _ q: Int, _ arr: [Int]) -> [Int] {
//    guard p < q else {
//      return [arr[p]]
//    }
//    let mid = (p + q) / 2
//    let a = sort(p, mid, arr)
//    let b = sort(mid + 1, q, arr)
//    return merge(a, b)
//  }
//
//  func sortList(_ head: ListNode?) -> ListNode? {
//    guard let head = head else {
//      return nil
//    }
//    var preNode: ListNode? = head
//    var arr: [Int] = []
//    while preNode != nil {
//      arr.append(preNode!.val)
//      preNode = preNode?.next
//    }
//    arr = sort(0, arr.count - 1, arr)
//    let root = ListNode(arr[0])
//    preNode = root
//    for i in 1..<arr.count {
//      preNode?.next = ListNode(arr[i])
//      preNode = preNode?.next
//    }
//    return root
//  }
  
  func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
      return l2
    } else if l2 == nil {
      return l1
    }
    let l: ListNode? = ListNode(0)
    var p = l
    var l1 = l1
    var l2 = l2
    while l1 != nil && l2 != nil {
      if l1!.val < l2!.val {
        p?.next = l1
        l1 = l1?.next
      } else {
        p?.next = l2
        l2 = l2?.next
      }
      p = p?.next
    }
    
    if l1 != nil {
      p?.next = l1
    }
    if l2 != nil {
      p?.next = l2
    }
    
    return l?.next
  }
  
  func sortList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
      return head
    }
    var slow = head
    var fast = head
    var prev: ListNode? = nil
    while fast != nil && fast?.next != nil {
      prev = slow
      slow = slow?.next
      fast = fast?.next?.next
    }
    prev?.next = nil
    
    let l1 = sortList(head)
    let l2 = sortList(slow)
    
    return merge(l1, l2)
  }
  
  func test() {
    var root: ListNode? = nil
    root = sortList(ListNode.generate([4,2,1,3]))
    root?.traverse()
    
    root = sortList(ListNode.generate([-1,5,3,4,0]))
    root?.traverse()
    
    root = sortList(ListNode.generate([]))
    root?.traverse()

    root = sortList(ListNode.generate([1]))
    root?.traverse()
  }
  
}
