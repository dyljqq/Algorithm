//
//  O09.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/13.
//

import Foundation

class CQueue {
  
  var inStack: [Int] = []
  var outStack: [Int] = []
  
  init() {
    
  }
  
  func appendTail(_ value: Int) {
    inStack.append(value)
  }
  
  func deleteHead() -> Int {
    if outStack.isEmpty {
      outStack = inStack.reversed()
      inStack = []
    }
    return outStack.popLast() ?? -1
  }
}

class MyStack {
  
  var inArr: [Int] = []
  var outArr: [Int] = []
  
  init() {
    
  }
  
  func push(_ x: Int) {
    inArr.append(x)
  }
  
  func pop() -> Int {
    outArr.append(contentsOf: inArr)
    inArr = []
    return outArr.popLast() ?? -1
  }
  
  func top() -> Int {
    return inArr.last ?? outArr.last ?? -1
  }
  
  func empty() -> Bool {
    return outArr.isEmpty && inArr.isEmpty
  }
}
