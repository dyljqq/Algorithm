//
//  869.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/26.
//

import Foundation

class Leetcode869 {
  
  func reorderedPowerOf2(_ n: Int) -> Bool {
    var cnt = 1
    let total = Int(pow(10.0, 9.0))
    var hash: [Int: [[String.Element:Int]]] = [:]
    while cnt < total {
      let s = String(cnt)
      var d: [String.Element: Int] = [:]
      s.forEach { d[$0, default: 0] += 1 }
      hash[s.count, default: []].append(d)
      cnt *= 2
    }
    
    let s = String(n)
    let values = hash[s.count, default: []]
    for d in values {
      var h = d, flag = true
      for ch in s {
        guard let v = h[ch], v > 0 else {
          flag = false
          break
        }
        h[ch]! -= 1
      }
      if flag {
        return true
      }
    }
    
    return false
  }
  
  func test() {
    print(reorderedPowerOf2(1))
    print(reorderedPowerOf2(10))
    print(reorderedPowerOf2(256))
    print(reorderedPowerOf2(625))
    print(reorderedPowerOf2(1024))
    print(reorderedPowerOf2(1025))
  }
  
}
