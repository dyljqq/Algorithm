//
//  MinimumCostForTickets.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/8.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MinimumCostForTickets {
  
  func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
    var dp: [Int] = Array(repeating: 0, count: 32)
    
    let r = days[days.count - 1]
    for i in 1...r {
      let a = max(i - 1, 0) % 31
      let b = max(i - 7, 0) % 31
      let c = max(i - 30, 0) % 31
      let d = i % 31
      if days.contains(i) {
        dp[d] = min(min(dp[a] + costs[0], dp[b] + costs[1]), dp[c] + costs[2])
      } else {
        dp[d] = dp[a]
      }
    }
    return dp[r % 31]
  }
  
  func test() {
    print(mincostTickets([1,4,6,7,8,20], [2, 7, 15]))
    print(mincostTickets([1,2,3,4,5,6,7,8,9,10,30,31], [2, 7, 15]))
  }
  
}
