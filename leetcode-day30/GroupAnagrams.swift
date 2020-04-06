//
//  GroupAnagrams.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/6.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class GroupAnagrams {
  
  func groupAnagrams(_ strs: [String]) -> [[String]] {
    guard !strs.isEmpty else {
      return [[String]]()
    }
    var hash: [String: [String]] = [:]
    for str in strs {
      let key = String(str.sorted())
      if hash[key] != nil {
        hash[key]?.append(str)
      } else {
        hash[key] = [str]
      }
    }
    return hash.reduce([[String]]()) { $0 + [$1.value] }
  }
  
  func test() {
    print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
  }
  
}
