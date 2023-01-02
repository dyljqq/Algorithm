//
//  520.swift
//  Leetcode
//
//  Created by jiqinqiang on 2023/1/2.
//

import Foundation

class Leetcode520 {
  
  func allLowerCase(_ chs: String.SubSequence, isUpper: Bool) -> Bool {
    for ch in chs {
      if isUpper && !ch.isUppercase {
        return false
      } else if !isUpper && ch.isUppercase {
        return false
      }
    }
    return true
  }
  
  func detectCapitalUse(_ word: String) -> Bool {
    guard !word.isEmpty else { return true }
    let flag = word.first!.isUppercase
    let word = word.dropFirst()
    return flag ? (allLowerCase(word, isUpper: false) || allLowerCase(word, isUpper: true)) : allLowerCase(word, isUpper: false)
  }
  
  func test() {
    print(detectCapitalUse("USA"))
    print(detectCapitalUse("FlaG"))
  }
}
