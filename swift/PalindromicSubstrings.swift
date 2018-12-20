//
//  PalindromicSubstrings.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/12/20.
//  Copyright © 2018 dyljqq. All rights reserved.
//

import Foundation

/**
 解题报告:
 题目: Given a string, your task is to count how many palindromic substrings in this string.
 
 The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.
 
 题目大意:
 就是找出给定的字符串中的所有回文子字符串。
 **/

class PalindromicSubstrings {
  func countSubstrings(_ s: String) -> Int {
    var res = 0
    let s = Array(s)
    for index in 0..<s.count {
      res += palindromicStr(s, index, index)
      res += palindromicStr(s, index, index + 1)
    }
    return res
  }
  
  func palindromicStr(_ s: [String.Element], _ l: Int, _ r: Int) -> Int {
    var l = l
    var r = r
    var res = 0
    while l >= 0 && r < s.count {
      if s[l] != s[r] { return res }
      
      res += 1
      l -= 1
      r += 1
    }
    return res
  }
  
  func test() {
    let s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    print(countSubstrings(s))
  }
}
