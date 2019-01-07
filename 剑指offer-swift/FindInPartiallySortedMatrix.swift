
//
//  FindInPartially.swift
//  offer
//
//  Created by 季勤强 on 2019/1/7.
//  Copyright © 2019 dyljqq. All rights reserved.
//

import Foundation

class FindInPartiallySortedMatrix {
  
  func find(_ arr: [[Int]], _ des: Int) -> Bool {
    var row = 0
    var col = arr[0].count - 1
    while row < arr.count && col >= 0 {
      if arr[row][col] == des {
        return true
      } else if arr[row][col] > des {
        col -= 1
      } else {
        row += 1
      }
    }
    return false
  }
  
  func test() {
    let arr = [[1, 2, 8, 9], [2, 4, 9, 12], [4, 7, 10, 13], [6, 8, 11, 15]]
    print(find(arr, 7))
    print(find(arr, 5))
    print(find(arr, 12))
    print(find(arr, 20))
  }
  
}
