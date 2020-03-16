//
//  DecodeString.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/16.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class DecodeString {
  
  func getMultiplicier(_ stack: inout [String]) -> String {
    var temp: [String] = []
    while !stack.isEmpty {
      let t = stack.removeLast()
      if t == "[" {
        break
      }
      temp.append(t)
    }
    return temp.reversed().reduce("") { $0 + $1 }
  }

  func getMultiplicand(_ stack: inout [String]) -> String {
    var temp: [String] = []
    while !stack.isEmpty {
      let t = stack.last ?? ""
      if t >= "0" && t <= "9" {
        temp.append(stack.removeLast())
      } else {
        break
      }
    }
    return temp.reversed().reduce("") { $0 + $1 }
  }
  
  func helper(_ stack: inout [String]) -> String {
    let multiplier = getMultiplicier(&stack)
    let multiplicand = getMultiplicand(&stack)
    if let num = Int(multiplicand) {
      return (0..<num).reduce("") { result, _ in
        return result + multiplier
      }
    }
    return multiplier
  }
  
  func decodeString(_ s: String) -> String {
    guard !s.isEmpty else {
      return ""
    }
    var stack: [String] = []
    for c in s {
      let a = String(c)
      if a == "]" {
        stack.append(helper(&stack))
      } else {
        stack.append(a)
      }
    }
    
    return stack.reduce("") { $0 + $1 }
  }
  
  func test() {
    print(decodeString("3[a]2[bc]"))
    print(decodeString("3[a2[c]]"))
    print(decodeString("2[abc]3[cd]ef"))
    print(decodeString("100[leetcode]"))
    print(decodeString("3[a]2[b4[F]c]"))
    
    // "zzzyypqjkjkefjkjkefjkjkefjkjkefyypqjkjkefjkjkefjkjkefjkjkefef"
//    print(decodeString("2[jk]e1[f]"))
//    print(decodeString("4[2[jk]e1[f]]"))
    print(decodeString("3[z]2[2[y]pq4[2[jk]e1[f]]]ef"))
    print("zzzyypqjkjkefjkjkefjkjkefjkjkefyypqjkjkefjkjkefjkjkefjkjkefef" == "zzzyypqjkjkefjkjkefjkjkefjkjkefyypqjkjkefjkjkefjkjkefjkjkefef")
  }
  
}
