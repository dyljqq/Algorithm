//
//  DistributeCandies.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/5.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class DistributeCandies {
  func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
    var nums: [Int] = Array(repeating: 0, count: num_people)
//    var total = 0
//    var count = 0
//    while (total + count + 1) <= candies {
//      nums[Int(count % num_people)] += count + 1
//      count += 1
//      total += count
//    }
//    let diff = candies - total
//    if diff > 0 {
//      nums[Int(count % num_people)] += diff
//    }
    
    // better method
    var total = 0
    let mn = Int((sqrt(1 + 8 * Double(candies)) - 1) / 2) + 1
    for i in 1...mn {
      nums[(i - 1) % num_people] += (total + i) > candies ? (candies - total) : i
      total += i
    }
    return nums
  }
  
  func test() {
//    print(distributeCandies(7, 4))
    print(distributeCandies(10, 3))
    print(distributeCandies(600, 40))
//    print(distributeCandies(1, 1000))
  }
}
