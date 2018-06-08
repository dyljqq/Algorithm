//
//  Stack.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/8.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

struct Stack<T> {
  
  private var arr: [T] = []
  
  var isEmpty: Bool {
    return arr.count == 0
  }
  
  var top: T? {
    return isEmpty ? nil : arr[arr.count - 1]
  }
  
  mutating func push(_ item: T) {
    arr.append(item)
  }
  
  mutating func pop() {
    arr.removeLast()
  }
  
}
