//
//  TopKFrequentElements.swift
//  LeetCode
//
//  Created by 季勤强 on 2019/1/2.
//  Copyright © 2019 dyljqq. All rights reserved.
//

import Foundation

/**
 题目大意:
 Given a non-empty array of integers, return the k most frequent elements.
 给你一个数组，找出这个数组中元素最多的k个
 **/
class TopKFrequentElements {
  func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var d = [Int: Int]()
    nums.forEach { num in
      d[num, default: 0] += 1
    }
    return Array(d.sorted(by: {$0.1 > $1.1}).map { $0.0 }[0..<k])
  }
  
  func test() {
    print(topKFrequent([1, 1, 1, 2, 2, 3], 2))
    print(topKFrequent([1], 1))
  }
}
