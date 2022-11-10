//
//  1047.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/10.
//

import Foundation

// 1047. Remove All Adjacent Duplicates In String
class Leetcode1047 {
  func removeDuplicates(_ s: String) -> String {
    var stack: [Character] = []
    for ch in s {
      if let top = stack.last, top == ch {
        stack.removeLast()
      } else {
        stack.append(ch)
      }
    }
    return String(stack)
  }
  
  func test() {
    print(removeDuplicates("abbaca"))
  }
}
