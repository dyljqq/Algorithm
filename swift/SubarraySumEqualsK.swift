//
//  SubarraySumEqualsK.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/27.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class SubarraySumEqualsK {
  
  func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var hash: [Int: Int] = [:]
    hash[0] = 1
    
    var res = 0
    var sum = 0
    for num in nums {
      sum += num
      res += hash[sum - k] ?? 0
      hash[sum] = (hash[sum] ?? 0) + 1
    }
    return res
  }
  
}
