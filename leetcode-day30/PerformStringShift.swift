//
//  PerformStringShift.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/14.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class PerformStringShift {
  
  func stringShift(_ s: String, _ shift: [[Int]]) -> String {
    var total = (shift.reduce(0) { $0 + ($1[0] == 0 ? $1[1] : -$1[1]) }) % s.count
    let arr = Array(s)
    if total < 0 {
      total = s.count + total
    }
    return String(arr[total..<s.count] + arr[0..<total])
  }
  
  func test() {
//    print(stringShift("abc", [[0,1],[1,2]]))
//    print(stringShift("abcdefg", [[1,1],[1,1],[0,2],[1,3]]))
    print(stringShift("wpdhhcj", [[0,7],[1,7],[1,0],[1,3],[0,3],[0,6],[1,2]]))
  }
  
}
