//
//  MergeInterval.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/4.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MergeInterval {
  
  func merge(_ intervals: [[Int]]) -> [[Int]] {
    var intervals = intervals
    guard !intervals.isEmpty else {
      return intervals
    }
    intervals.sort { $0[0] < $1[0] }
    var temp = intervals[0]
    var arr: [[Int]] = []
    for i in 1..<intervals.count {
      let interval = intervals[i]
      if temp[1] < interval[0] {
        arr.append(temp)
        temp = intervals[i]
      } else {
        let m = max(temp[1], interval[1])
        temp = [temp[0], m]
      }
    }
    arr.append(temp)
    return arr
  }
  
  func test() {
    print(merge([[1,3],[2,6],[8,10],[15,18]]))
    print(merge([[1,4],[4,5]]))
  }
  
}
