//
//  17.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/16.
//

import Foundation

class Leetcode17 {
  
  func letterCombinations(_ digits: String) -> [String] {
    guard !digits.isEmpty else {
      return []
    }
    let letters: [String] = [
      "abc",
      "def",
      "ghi",
      "jkl",
      "mno",
      "pqrs",
      "tuv",
      "wxyz"
    ]
    var dp: [String] = [""]
    for digit in digits {
      let v = Int(String(digit))! - 2
      var rs: [String] = []
      for ch in letters[v] {
        for s in dp {
          rs.append(s + String(ch))
        }
      }
      dp = rs
    }
    return dp
  }
  
  func test() {
    print(letterCombinations("23"))
    print(letterCombinations(""))
    print(letterCombinations("2"))
  }
  
}
