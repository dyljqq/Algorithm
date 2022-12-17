//
//  150.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/17.
//

import Foundation

class Leetcode150 {
  func evalRPN(_ tokens: [String]) -> Int {
    var stack: [Int] = []
    let operations: [String] = ["+", "-", "*", "/"]
    for token in tokens {
      if operations.contains(token) {
        let v1 = stack.removeLast()
        let v2 = stack.removeLast()
        let v: Int
        if token == "+" {
          v = v1 + v2
        } else if token == "-" {
          v = v2 - v1
        } else if token == "*" {
          v = v1 * v2
        } else if token == "/" && v2 != 0 {
          v = v2 / v1
        } else {
          v = 0
        }
        stack.append(v)
      } else {
        stack.append(Int(token)!)
      }
    }
    return stack.last ?? 0
  }
  
  func test() {
    print(evalRPN(["2","1","+","3","*"]))
    print(evalRPN(["4","13","5","/","+"]))
    print(evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))
  }
}
