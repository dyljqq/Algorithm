//
//  2279.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/27.
//

import Foundation

// 2279. Maximum Bags With Full Capacity of Rocks
// https://leetcode.com/problems/maximum-bags-with-full-capacity-of-rocks/description/
class Leetcode2279 {
  func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
    let n = capacity.count
    let rs = (0..<n).map { capacity[$0] - rocks[$0] }.sorted()
    var sum = 0, additionalRocks = additionalRocks
    for r in rs {
      guard (additionalRocks - r) >= 0 else { break }
      additionalRocks -= r
      sum += 1
    }
    return sum
  }
  
  func test() {
    print(maximumBags([2,3,4,5], [1,2,4,4], 2))
    print(maximumBags([10,2,2], [2,2,0], 100))
    print(maximumBags([91,54,63,99,24,45,78], [35,32,45,98,6,1,25], 17))
  }
}
