//
//  TaskScheduler.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/17.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class TaskScheduler {
  
  func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    guard !tasks.isEmpty else {
      return 0
    }
    var arr = Array(repeating: 0, count: 26)
    tasks.forEach { arr[Int($0.asciiValue! - Character("A").asciiValue!)] += 1 }
    arr.sort()
    var i = 25
    while i >= 0 && arr[i] == arr[25] {
      i -= 1
    }
    return max(tasks.count, (arr[25] - 1) * (n + 1) + 25 - i)
  }
  
  func test() {
//    print(leastInterval(["A","A","A","B","B","B", "C", "C", "C", "C", "C", "D"], 2))
    print(leastInterval(["G","C","A","H","A"], 1))
  }
  
}
