//
//  49.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/28.
//

import Foundation

class Leetcode49 {
  
//  func groupAnagrams(_ strs: [String]) -> [[String]] {
//    var hash: [String: [String]] = [:]
//    strs.forEach { str in
//      let sorted = String(str.sorted())
//      if hash[sorted] == nil {
//        hash[sorted] = [str]
//      } else {
//        hash[sorted]!.append(str)
//      }
//    }
//    return hash.values.map { $0 }
//  }
  
  func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict: [String: [String]] = [:]
    for str in strs {
      var arr = Array(repeating: 0, count: 26)
      for ch in str {
        let diff = ch.asciiValue! - Character("a").asciiValue!
        arr[Int(diff)] += 1
      }
      
      var key = ""
      for i in 0..<26 {
        guard arr[i] > 0 else { continue }
        let ch = Character(UnicodeScalar(Character("a").asciiValue! + UInt8(i)))
        key += "\(ch)\(arr[i])"
      }
      
      if dict[key] == nil {
        dict[key] = [str]
      } else {
        dict[key]!.append(str)
      }
    }
    return dict.values.map { $0 }
  }
  
  func test() {
    print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
  }
  
}
