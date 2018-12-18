//
//  JewelsAndStones.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/12/18.
//  Copyright © 2018 dyljqq. All rights reserved.
//

import Foundation
/**
 解题报告:
 题目: You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
 
 The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
 
 题目大意就是，在S字符串中，找到和J中字符串相同的字符的个数，并输出。
 **/
class JewelsAndStones {
  func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var d: [Character: Int] = [:]
    for c in S {
      if let v = d[c] {
        d[c] = v + 1
      } else {
        d[c] = 1
      }
    }
    return J.reduce(0) { $0 + (d[$1] ?? 0) }
  }
  
  func test() {
    print(numJewelsInStones("aA", "aAAbbbb"))
    print(numJewelsInStones("z", "ZZ"))
    print("end...")
  }
}
