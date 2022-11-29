//
//  380.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/29.
//

import Foundation

class RandomizedSet {
  
  var set = Set<Int>()
  
  init() {
    
  }
  
  func insert(_ val: Int) -> Bool {
    let isPresent = set.contains(val)
    if !isPresent {
      set.insert(val)
    }
    return !isPresent
  }
  
  func remove(_ val: Int) -> Bool {
    let isPresent = set.contains(val)
    if isPresent {
      set.remove(val)
    }
    return isPresent
  }
  
  func getRandom() -> Int {
    guard !set.isEmpty, let ram = set.randomElement() else { return -1 }
    return ram
  }
}
