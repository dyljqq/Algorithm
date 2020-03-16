//
//  CompressStringLcci.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/16.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class CompressStringLcci {
  
  func compressString(_ S: String) -> String {
    guard !S.isEmpty else { return "" }
    var s = ""
    var count = 0
    let arr = Array(S)
    for i in 0..<(arr.count - 1) {
      if arr[i] == arr[i + 1] {
        count += 1
      } else {
        s += "\(arr[i])\(count + 1)"
        count = 0
      }
    }
    s += "\(arr[arr.count - 1])\(count + 1)"
    return s.count < S.count ? s : S
  }
  
  func test() {
    print(compressString("aabcccccaaa"))
    print(compressString("abbccd"))
  }
  
}
