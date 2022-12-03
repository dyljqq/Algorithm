//
//  451.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/3.
//

import Foundation

class Leetcode451 {
  
  func frequencySort(_ s: String) -> String {
    var hash: [Character: Int] = [:]
    s.forEach { hash[$0, default: 0] += 1 }
    
    var rh: [Int: String] = [:]
    for (key, value) in hash {
      rh[value, default: ""] += (0..<value).map { _ in String(key) }.reduce("", +)
    }
    return rh.keys.sorted { $0 > $1 }.reduce("") { $0 + rh[$1]! }
  }
  
  func test() {
    print(frequencySort("tree"))
    print(frequencySort("Aabb"))
    print(frequencySort("cccaaa"))
  }
  
}
