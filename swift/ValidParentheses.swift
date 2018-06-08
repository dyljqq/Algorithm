//
//  ValidParentheses.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/8.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class ValidParentheses {
  func isValid(_ s: String) -> Bool {
    guard s.count % 2 == 0 else { return false }
    let d = ["(": ")", "[": "]", "{": "}"]
    let lefts = ["(", "[", "{"]
    var stack = Stack<Character>()
    
    for c in s {
      if lefts.contains(String(c)) {
        stack.push(c)
      } else {
        guard let top = stack.top else { return false }
        guard let t = d[String(top)], t == String(c) else { return false }
        stack.pop()
      }
    }
    
    return stack.isEmpty
  }
  
  func test() {
    let tests = ["()", "()[]{}", "(]", "([)]", "{[]}", "(("]
    tests.forEach { print(isValid($0)) }
  }
}
