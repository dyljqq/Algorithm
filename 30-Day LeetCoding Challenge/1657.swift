//
//  1657.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/2.
//

import Foundation

class Leetcode1657 {
  func closeStrings(_ word1: String, _ word2: String) -> Bool {
    guard word1.count == word2.count else { return false }
    var hash1: [Character: Int] = [:], hash2: [Character: Int] = [:]
    word1.forEach { hash1[$0, default: 0] += 1 }
    word2.forEach { hash2[$0, default: 0] += 1 }
    return hash1.keys.sorted() == hash2.keys.sorted() && hash1.values.sorted() == hash2.values.sorted()
  }
  
  func test() {
    print(closeStrings("abc", "bca"))
    print(closeStrings("a", "aa"))
    print(closeStrings("cabbba", "abbccc"))
  }
}
