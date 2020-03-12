//
//  GreatestCommonDivisorOfStrings.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/12.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class GreatestCommonDivisorOfStrings {
  
//  func isValid(_ str1: String, _ str2: String) -> Bool {
//    guard !str2.isEmpty && str1.count % str2.count == 0 else { return false }
//
//    var startIndex = str1.startIndex
//    for _ in 1...(str1.count / str2.count) {
//      let endIndex = str1.index(startIndex, offsetBy: str2.count)
//      let str = String(str1[startIndex..<endIndex])
//      if !str.isEqual(str2) {
//        return false
//      }
//      startIndex = endIndex
//    }
//    return true
//  }
//
//  func gcdOfStrings(_ str1: String, _ str2: String) -> String {
//    guard !str1.isEmpty && !str2.isEmpty else {
//      return ""
//    }
//    var maxStr = str1
//    var minStr = str2
//
//    if maxStr.count < minStr.count {
//      maxStr = str2
//      minStr = str1
//    }
//
//    let end = minStr.count / 2 + 1
//    var checkStr = minStr
//    for i in 1...end {
//      if isValid(maxStr, checkStr) {
//        return checkStr
//      }
//      if minStr.count % (i + 1) == 0 {
//        checkStr = String(minStr[minStr.startIndex..<minStr.index(minStr.startIndex, offsetBy: minStr.count / (i + 1))])
//      }
//    }
//
//    return ""
//  }
  
  func gcdOfStrings(_ str1: String, _ str2: String) -> String {
    guard (str1 + str2).isEqual(str2 + str1) else {
      return ""
    }
    return str2.isEmpty ? str1 : gcdOfStrings(str2, String(str1[str1.startIndex..<str1.index(str1.startIndex, offsetBy: str1.count % str2.count)]))
  }
  
  func test() {
    print(gcdOfStrings("ABCABC", "ABC"))
    print(gcdOfStrings("ABABAB", "ABAB"))
    print(gcdOfStrings("LEET", "CODE"))
    print(gcdOfStrings("AAAAAA", "A"))
    print(gcdOfStrings("TAUXXTAUXXTAUXXTAUXXTAUXXTAUXX", "TAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXX"))
    print(gcdOfStrings("NLZGMNLZGMNLZGMNLZGMNLZGMNLZGMNLZGMNLZGM", "NLZGMNLZGMNLZGMNLZGMNLZGMNLZGMNLZGMNLZGMNLZGM"))
  }
  
}
