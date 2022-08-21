//
//  659.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/22.
//

import Foundation

class Leetcode659 {
  
  func isPossible(_ nums: [Int]) -> Bool {
    var nc: [Int: Int] = [:]
    var tail: [Int: Int] = [:]
    
    nums.forEach { num in
      nc[num, default: 0] += 1
      tail[num] = 0
    }
    
    for num in nums {
      guard nc[num]! > 0 else {
        continue
      }
      
      if let n = tail[num - 1], n > 0 {
        tail[num - 1] = tail[num - 1]! - 1
        nc[num] = nc[num]! - 1
        tail[num] = tail[num]! + 1
      } else if let n1 = nc[num], n1 > 0, let n2 = nc[num + 1], n2 > 0, let n3 = nc[num + 2], n3 > 0 {
        nc[num] = nc[num]! - 1
        nc[num + 1] = nc[num + 1]! - 1
        nc[num + 2] = nc[num + 2]! - 1
        tail[num + 2] = tail[num + 2, default: 0] + 1
      } else {
        return false
      }
     }
    
    return true
  }
  
  func test() {
    print(isPossible([1,2,3,3,4,5]))
    print(isPossible([1,2,3,3,4,4,5,5]))
    print(isPossible([1,2,3,4,4,5]))
  }
  
}
