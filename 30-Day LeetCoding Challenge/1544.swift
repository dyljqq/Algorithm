//
//  1544.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/8.
//

import Foundation

// https://leetcode.com/problems/make-the-string-great/
class Leetcode1544 {
  
  func makeGood(_ s: String) -> String {
    var stack: [Character] = []
    let distance = Int(Character("a").asciiValue! - Character("A").asciiValue!)
    for ch in s {
      if let top = stack.last, abs(Int(top.asciiValue!) - Int(ch.asciiValue!)) == abs(distance) {
        stack.removeLast()
      } else {
        stack.append(ch)
      }
    }
    return String(stack)
  }
  
  func test() {
    print(makeGood("leEeetcode"))
    print(makeGood("abBAcC"))
  }
  
}
