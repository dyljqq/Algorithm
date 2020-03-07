//
//  MaxQueue.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/7.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MaxQueue {

  var queue: [Int] = []
  var deque: [Int] = []
  
  init() {
    
  }
  
  func max_value() -> Int {
    return deque.first ?? -1
  }
  
  func push_back(_ value: Int) {
    queue.append(value)
    while !deque.isEmpty && value > deque.last! {
      deque.removeLast()
    }
    deque.append(value)
  }
  
  func pop_front() -> Int {
    guard !queue.isEmpty else {
      return -1
    }
    let res = queue.removeFirst()
    if res == deque.first {
      deque.removeFirst()
    }
    return res
  }
}
