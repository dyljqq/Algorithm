//
//  1592.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/7.
//

import Foundation

class Leetcode1592 {
  
  func reorderSpaces(_ text: String) -> String {
    let words = text.split(separator: " ")
    let spaceCount = text.count - words.joined().count
    let separatorCount = words.count - 1 == 0 ? 0 : spaceCount / (words.count - 1)
    let traillingCount = spaceCount - separatorCount * (words.count - 1)
    let spaceString = String([Character](repeating: " ", count: separatorCount))
    let trailString = String([Character](repeating: " ", count: traillingCount))
    return words.joined(separator: spaceString) + trailString
  }
  
  func test() {
    print(reorderSpaces("  this   is  a sentence "))
    print(reorderSpaces(" practice   makes   perfect"))
    print(reorderSpaces("  this   is  a sentence "))
  }
  
}
