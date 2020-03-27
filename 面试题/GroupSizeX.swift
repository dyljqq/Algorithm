//
//  GroupSizeX.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/27.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class GroupSizeX {
  
  func gcd(_ a: Int, _ b: Int) -> Int {
    return b > 0 ? gcd(b, a % b) : a
  }
  
  func hasGroupsSizeX(_ deck: [Int]) -> Bool {
    guard deck.count > 1 else { return false }
    var d: [Int: Int] = [:]
    for k in deck {
        d[k] = (d[k] ?? 0) + 1
    }

    var g = 0
    for (_, value) in d {
      g = g > 0 ? gcd(value, g) : value
    }
    return g >= 2
  }
  
  func test() {
    
  }
  
}
