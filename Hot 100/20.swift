//
//  20.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/20.
//

import Foundation

class Leetcode20 {
  
  func isValid(_ s: String) -> Bool {
    guard !s.isEmpty && s.count % 2 == 0 else {
      return false
    }
    
    var stack: [String.Element] = []
    for ch in s {
      if ["(", "[", "{"].contains(ch) {
        stack.append(ch)
      } else {
        guard let top = stack.popLast(),
              (top == "(" && ch == ")") || (top == "[" && ch == "]") || (top == "{" && ch == "}") else {
          return false
        }
      }
    }
    return stack.isEmpty
  }
  
  func test() {
    print(isValid("()"))
    print(isValid("()[]{}"))
    print(isValid("(]"))
  }
  
}
