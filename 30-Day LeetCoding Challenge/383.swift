//
//  383.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/25.
//

import Foundation

class Leetcode383 {
  
  func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var map: [String.Element: Int] = [:]
    magazine.forEach { map[$0, default: 0] += 1 }
    
    for ch in ransomNote {
      map[ch, default: 0] -= 1
      if let v = map[ch], v < 0 {
        return false
      }
    }
    
    return true
  }
  
  func test() {
    print(canConstruct("a", "b"))
    print(canConstruct("aa", "ab"))
    print(canConstruct("aa", "aab"))
  }
  
}
