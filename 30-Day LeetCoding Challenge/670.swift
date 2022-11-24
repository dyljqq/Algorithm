//
//  670.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/24.
//

import Foundation

class Leetcode670 {
  func maximumSwap(_ num: Int) -> Int {
    var maxArr: [Int] = [], nums: [Int] = []
    var num = num, maxIndex = 0
    while num > 0 {
      let r = num % 10
      nums.append(r)
      if r > nums[maxIndex] {
        maxIndex = nums.count - 1
      }
      maxArr.append(maxIndex)
      num = num / 10
    }
    
    for i in stride(from: nums.count - 1, to: -1, by: -1) {
      if nums[i] != nums[maxArr[i]] {
        nums.swapAt(i, maxArr[i])
        break
      }
    }
    
    return nums.reversed().reduce(0) { $0 * 10 + $1 }
  }
  
  func test() {
    print(maximumSwap(2736))
    print(maximumSwap(9973))
  }
}
