//
//  JumpGame.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/9.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class JumpGame {
  
//  func dfs(_ pos: Int, _ step: Int, _ nums: [Int], _ visited: inout [Bool]) -> Bool {
//    var count = step
//    while count > 0 {
//      let curPos = pos + count
//      if curPos < visited.count && !visited[curPos] {
//        return false
//      }
//      if curPos >= nums.count - 1 {
//        return true
//      }
//      if dfs(curPos, nums[curPos], nums, &visited) {
//        return true
//      }
//      visited[curPos] = false
//      count -= 1
//    }
//    return (pos + step) == nums.count - 1
//  }
//
//  func canJump(_ nums: [Int]) -> Bool {
//    guard !nums.isEmpty else {
//      return false
//    }
//    var visited = Array(repeating: true, count: nums.count + 1)
//    return dfs(0, nums[0], nums, &visited)
//  }
  
  func canJump(_ nums: [Int]) -> Bool {
    guard !nums.isEmpty else {
      return false
    }
    var cnt = 0
    var reach = 0
    while cnt < nums.count && cnt <= reach {
      reach = max(reach, cnt + nums[cnt])
      cnt += 1
    }
    return cnt == nums.count
  }
  
  func test() {
    print(canJump([2,1,1,1,4]))
    print(canJump([3,2,1,0,4]))
    print(canJump([0]))
    print(canJump([1, 3, 2]))
  }
  
}
