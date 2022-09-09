//
//  1996.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/9.
//

import Foundation

class Leetcode1996 {
  
  func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
    let properties = properties.sorted { p1, p2 in
      if p1[0] == p2[0] {
        return p1[1] > p2[1]
      }
      return p1[0] < p2[0]
    }
    var mx = Int.min, cnt = 0
    for i in stride(from: properties.count - 1, to: -1, by: -1) {
      if properties[i][1] < mx {
        cnt += 1
      }
      mx = max(properties[i][1], mx)
    }
    return cnt
  }
  
  func test() {
    print(numberOfWeakCharacters([[5,5],[6,3],[3,6]]))
    print(numberOfWeakCharacters([[2,2],[3,3]]))
    print(numberOfWeakCharacters([[1,5],[10,4],[4,3]]))
  }
  
}
