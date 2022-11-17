//
//  792.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/17.
//

import Foundation

// 792. 匹配子序列的单词数
// https://leetcode.cn/problems/number-of-matching-subsequences/
class LeetcodeCN792 {
  func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
    var hash: [String: Int] = [:]
    var buckets: [Character: [(Int, Int)]] = [:]
    
    for (i, word) in words.enumerated() {
      guard let v = word.first else { continue }
      if hash[word] == nil {
        buckets[v, default: []].append((i, 0))
      }
      hash[word, default: 0] += 1
    }
    
    var total = 0
    for ch in s {
      guard var bucket = buckets[ch] else { continue }
      for _ in 0..<bucket.count {
        let (a, b) = buckets[ch, default: []].removeFirst()
        if (b + 1) == words[a].count {
          total += hash[words[a], default: 0]
        } else {
          let c = Array(words[a])[b + 1]
          buckets[c, default: []].append((a, b + 1))
        }
      }
    }
    return total
  }
  
  func test() {
    print(numMatchingSubseq("abcde", ["a","bb","acd","ace"]))
    print(numMatchingSubseq("dsahjpjauf", ["ahjpjau","ja","ahbwzgqnuk","tnmlanowax"]))
  }
}
