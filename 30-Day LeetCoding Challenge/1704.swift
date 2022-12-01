//
//  1704.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/1.
//

import Foundation

class Leetcode1704 {
    
  func cal(_ s: ArraySlice<Character>, _ vowels: Set<Character>) -> Int {
    return s.reduce(0) { $0 + (vowels.contains($1) ? 1 : 0) }
  }
  
  func halvesAreAlike(_ s: String) -> Bool {
    let vowels: Set = Set("aeiouAEIOU")
    let half = s.count / 2
    let arr = Array(s)
    return cal(arr[0..<half], vowels) == cal(arr[half..<s.count], vowels)
  }
  
  func test() {
    print(halvesAreAlike("book"))
    print(halvesAreAlike("textbook"))
  }
  
}
