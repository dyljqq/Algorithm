//
//  MajorityElement.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/13.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MajorityElement {
//  func majorityElement(_ nums: [Int]) -> Int {
//    let d = nums.reduce([Int: Int]()) { r, v in
//      var r = r
//      r[v] = (r[v] ?? 0) + 1
//      return r
//    }
//    for (key, value) in d {
//      if value > (nums.count / 2) {
//        return key
//      }
//    }
//    return 0
//  }
  
  func majorityElement(_ nums: [Int]) -> Int {
    var numsCount = 0
    var target = nums[0]
    for i in 1..<nums.count {
      if target != nums[i] {
        numsCount -= 1
      } else {
        numsCount += 1
      }
      if numsCount < 0 {
        target = nums[i]
        numsCount = 0
      }
    }
    return target
  }
  
  func test() {
    print(majorityElement([3,2,3]))
    print(majorityElement([2,2,1,1,1,2,2]))
    print(majorityElement([47,47,72,47,72,47,79,47,12,92,13,47,47,83,33,15,18,47,47,47,47,64,47,65,47,47,47,47,70,47,47,55,47,15,60,47,47,47,47,47,46,30,58,59,47,47,47,47,47,90,64,37,20,47,100,84,47,47,47,47,47,89,47,36,47,60,47,18,47,34,47,47,47,47,47,22,47,54,30,11,47,47,86,47,55,40,49,34,19,67,16,47,36,47,41,19,80,47,47,37]))
  }
}
