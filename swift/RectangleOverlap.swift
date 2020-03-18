//
//  RectangleOverlap.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/18.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class RectangleOverlap {
  
  func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    guard rec1.count == 4 && rec2.count == 4 else {
      return false
    }
    return !((rec1[0] >= rec2[2] || rec1[2] <= rec2[0]) || (rec1[1] >= rec2[3] || rec1[3] <= rec2[1]))
  }
  
}
