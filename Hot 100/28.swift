//
//  28.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/24.
//

import Foundation

class Leetcode28 {
  
  func strStr(_ haystack: String, _ needle: String) -> Int {
    guard !haystack.isEmpty && !needle.isEmpty else {
      return -1
    }
    
    let needleCount = needle.count
    let haystackArray = Array(haystack)
    
    for i in 0..<haystack.count {
      if haystackArray[i] == needle.first! && (i + needleCount) <= haystack.count {
        let checkStr = String(haystackArray[i..<(i + needleCount)])
        if checkStr == needle {
          return i
        }
      }
    }
    return -1
  }

  func test() {
    print(strStr("sadbutsad", "sad"))
    print(strStr("leetcode", "leeto"))
    print(strStr("babbbbbabb", "bbab"))
  }
  
}
