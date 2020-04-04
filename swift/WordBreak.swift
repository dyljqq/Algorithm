//
//  WordBreak.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/4.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class WordBreak {
  
  func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var hash: [String: Bool] = [:]
    wordDict.forEach { hash[$0] = true }
    
    let arr = Array(s)
    var dp: [Bool] = Array(repeating: false, count: s.count + 1)
    dp[0] = true
    for i in 1...s.count {
      for j in 0..<i {
        if dp[j] && hash[ String(arr[j..<i])] != nil {
          dp[i] = true
          break
        }
      }
    }
    return dp[s.count]
  }
  
  func test() {
    
    print(wordBreak("leetcode", ["leet", "code"]))
    print(wordBreak("applepenapple", ["apple", "pen"]))
    print(wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
    
  }
  
}
