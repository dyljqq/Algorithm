//
//  452.swift
//  Leetcode
//
//  Created by jiqinqiang on 2023/1/5.
//

import Foundation

class Leetcode452 {
  func findMinArrowShots(_ points: [[Int]]) -> Int {
    guard !points.isEmpty else { return 0 }
    let points = points.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
    var end = points[0][1], res = 1
    for point in points.dropFirst() {
      if end >= point[0] {
        end = min(end, point[1])
      } else {
        res += 1
        end = point[1]
      }
    }
    
    return res
  }
  
  func test() {
    print(findMinArrowShots([[10,16], [2,8],[1,6],[7,12]]))
    print(findMinArrowShots([[1,2],[3,4],[5,6],[7,8]]))
  }
}
