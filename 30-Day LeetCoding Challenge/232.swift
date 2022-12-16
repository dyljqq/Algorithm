//
//  232.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/16.
//

import Foundation

class MyQueue {
  
  private var arr: [Int] = []
  private var backup: [Int] = []
  
  init() {
    
  }
  
  func push(_ x: Int) {
    arr.append(x)
  }
  
  func pop() -> Int {
    if backup.isEmpty {
      backup.append(contentsOf: arr.reversed())
      arr = []
    }
    guard !backup.isEmpty else { return 0 }
    return backup.removeLast()
  }
  
  func peek() -> Int {
    if backup.isEmpty {
      backup.append(contentsOf: arr.reversed())
      arr = []
    }
    return backup.last ?? 0
  }
  
  func empty() -> Bool {
    return arr.isEmpty && backup.isEmpty
  }
}
