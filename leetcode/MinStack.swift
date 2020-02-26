//
//  MinStack.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/2/26.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MinStack {
  
  private var mi = Int.max
  private var stack:[Element] = []
  
  struct Element {
    let val: Int
    let minVal: Int
  }
  
  init() {
      
  }
  
  func push(_ x: Int) {
    if stack.isEmpty {
      mi = x
    } else {
      mi = min(x, self.getMin())
    }
    stack.append(Element(val: x, minVal: mi))
  }
  
  func pop() {
    let _ = stack.popLast()
  }
  
  func top() -> Int {
    return stack.last?.val ?? 0
  }
  
  func getMin() -> Int {
    guard let ele = stack.last else { return 0 }
    return ele.minVal
  }
  
  func test() {
    let minStack = MinStack()
    minStack.push(-2)
    minStack.push(0)
    minStack.push(-1)
    print(minStack.getMin())
    print(minStack.top())
    minStack.pop()
    print(minStack.getMin())
  }
}
