//
//  433.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/2.
//

import Foundation

// https://leetcode.com/problems/minimum-genetic-mutation/
class Leetcode433 {
  
  func findValidBankStr(_ start: String, _ bank: String) -> Bool {
    guard start.count == bank.count else { return false }
    let start = Array(start)
    let bank = Array(bank)
    
    var cnt = 0
    for i in 0..<start.count {
      if start[i] != bank[i] {
        cnt = cnt + 1
        if cnt > 1 {
          return false
        }
      }
    }
    return true
  }
  
  func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
    var queue: [(String, Int)] = [(start, 0)]
    var hash: [String: Bool] = [:]
    while !queue.isEmpty {
      let v = queue.removeFirst()
      if v.0 == end {
        return v.1
      }
      for str in bank {
        if hash[str] == nil && findValidBankStr(v.0, str) {
          hash[str] = true
          queue.append((str, v.1 + 1))
        }
      }
    }
    return -1
  }
  
  func test() {
    print(minMutation("AAAAACCC", "AACCCCCC", ["AAAACCCC","AAACCCCC","AACCCCCC"]))
  }
  
}
