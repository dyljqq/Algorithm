//
//  374.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/16.
//

import Foundation

// 374. Guess Number Higher or Lower
// https://leetcode.com/problems/guess-number-higher-or-lower/
class Leetcode374 {
  
  func guess(_ num: Int) -> Int {
    // TODO
    return 1
  }
  
  func guessNumber(_ n: Int) -> Int {
    var left = 1, right = n
    while left <= right {
      let mid = (left + right) / 2
      if guess(mid) == -1 {
        right = mid - 1
      } else if guess(mid) == 1 {
        left = mid + 1
      } else {
        return mid
      }
    }
    return -1
  }
  
  func test() {
    print(guessNumber(10))
  }
}
