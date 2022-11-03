//
//  2131.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/3.
//

import Foundation

// https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words/
class Leetcode2131 {
  func longestPalindrome(_ words: [String]) -> Int {
    var hash: [String: Int] = [:]
    var total = 0
    for word in words {
      let r = String(word.reversed())
      if let v = hash[r], v > 0 {
        hash[r] = v - 1
        total += 4
      } else {
        hash[word, default: 0] += 1
      }
    }
    
    for (key, v) in hash {
      if key.last == key.first, v > 0 {
        total += 2
        break
      }
    }
    return total
  }
  
  func test() {
    print(longestPalindrome(["cc","ll","xx"]))
    print(longestPalindrome(["ab","ty","yt","lc","cl","ab"]))
    print(longestPalindrome(["lc","cl","gg"]))
    print(longestPalindrome(["dd","aa","bb","dd","aa","dd","bb","dd","aa","cc","bb","cc","dd","cc"]))
    print(longestPalindrome(["em","pe","mp","ee","pp","me","ep","em","em","me"]))
    print(longestPalindrome(["dd","aa","bb","dd","aa","dd","bb","dd","aa","cc","bb","cc","dd","cc"]))
    print(longestPalindrome(["bb","bb"]))
  }
}
