//
//  11.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/13.
//

import Foundation

class Leetcode11 {
  
  func maxArea(_ height: [Int]) -> Int {
    var p = 0, q = height.count - 1, sum = 0
    while p < q {
      var area = 0
      if height[p] < height[q] {
        area = height[p] * (q - p)
        p = p + 1
      } else {
        area = height[q] * (q - p)
        q = q - 1
      }
      sum = max(sum, area)
    }
    return sum
  }
  
  func test() {
    print(maxArea([1,8,6,2,5,4,8,3,7]))
    print(maxArea([1, 1]))
  }
  
}
