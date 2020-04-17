//
//  ValidParenthesisString.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/17.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class ValidParenthesisString {
  
  func checkValidString(_ s: String) -> Bool {
    guard !s.isEmpty else {
      return true
    }
    var stack: [Character] = []
    let arr = Array(s)
    for a in arr {
      if a == ")" {
        if stack.isEmpty {
          return false
        }
        var cnt = stack.count - 1
        while cnt >= 0 {
          if stack[cnt] == "(" {
            stack.remove(at: cnt)
            break
          }
          cnt -= 1
        }
        if cnt == -1 {
          stack.removeLast()
        }
      } else {
        stack.append(a)
      }
    }

    for i in 0..<stack.count {
      if stack[i] == "(" {
        var cnt = i + 1
        while cnt < stack.count {
          if stack[cnt] == "*" {
            stack[cnt] = "-"
            break
          }
          cnt += 1
        }
        if cnt == stack.count {
          return false
        }
      }
    }
    return true
  }
  
  func test() {
//    print(checkValidString("()"))
//    print(checkValidString("(*)"))
//    print(checkValidString("((*)"))
//    print(checkValidString("((*))(()"))
    print(checkValidString("(())(())(((()*()()()))()((()()(*()())))(((*)()"))
  }
  
}
