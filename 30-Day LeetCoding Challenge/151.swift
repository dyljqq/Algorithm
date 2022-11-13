//
//  151.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/13.
//

import Foundation

// 151. Reverse Words in a String
// https://leetcode.com/problems/reverse-words-in-a-string/
class Leetcode151 {
  
//  func reverseStr(_ p: Int, _ q: Int, _ arr: inout [Character]) {
//    var count = 0
//    while count < ((q - p) / 2 + 1) {
//      arr.swapAt(p + count, q - count)
//      count = count + 1
//    }
//  }
//
//  func reverseWords(_ s: String) -> String {
//    guard !s.isEmpty else { return "" }
//    var arr = Array(s)
//    reverseStr(0, arr.count - 1, &arr)
//    var p = -1
//    var words: [[Character]] = []
//    for (i, ch) in arr.enumerated() {
//      if ch != Character(" ") {
//        if p == -1 {
//          p = i
//        }
//      } else {
//        if p != -1 {
//          reverseStr(p, i - 1, &arr)
//          let word = arr[p...(i - 1)]
//          words.append(Array(word))
//          p = -1
//        }
//      }
//    }
//    if arr.last! != Character(" ") {
//      reverseStr(p, arr.count - 1, &arr)
//      let word = arr[p...(arr.count - 1)]
//      words.append(Array(word))
//    }
//    return String(words.joined(separator: " "))
//  }
  
  func reverseWords(_ s: String) -> String {
    return s.components(separatedBy: " ").filter { !$0.isEmpty }.reversed().joined(separator: " ")
  }
  
  func test() {
    print(reverseWords("the sky is blue"))
    print(reverseWords("  hello world  "))
    print(reverseWords("a good   example"))
  }
}
