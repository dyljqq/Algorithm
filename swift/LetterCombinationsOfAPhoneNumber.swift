//
//  LetterCombinationsOfAPhoneNumber.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/23.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LetterCombinationsOfAPhoneNumber {
  
  func letterCombinations(_ digits: String) -> [String] {
    let aScalars = "a".unicodeScalars
    let aCode = aScalars[aScalars.startIndex].value
    
    var start = 0
    let letters: [[Character]] = (2..<10).map { num in
      var range:Range = (start..<(start + 3))
      if [7, 9].contains(num) {
        range = (start..<(start + 4))
        start += 4
      } else {
        start += 3
      }
      return range.map { Character(UnicodeScalar(aCode + UInt32($0))!) }
    }
    var rs: [String] = []
    for digit in Array(digits) {
      let num = Int(String(digit))! - 2
      if rs.isEmpty {
        rs = letters[num].map { String($0) }
      } else {
        let arr = letters[num].compactMap { ls in
          rs.compactMap { $0 + String(ls) }
        }
        rs = []
        arr.forEach { rs.append(contentsOf: $0) }
      }
    }
    return rs
  }
  
  func test() {
    print(letterCombinations("23"))
    print(letterCombinations("234"))
  }
  
}
