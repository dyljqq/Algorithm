//
//  Heep.swift
//  LeetCode
//
//  Created by 季勤强 on 2019/1/2.
//  Copyright © 2019 dyljqq. All rights reserved.
//

import Foundation

struct Heap<Element: Comparable> {
  var elements: [Element] = []
  var compareHandler: (Int, Int) -> Bool
  
  init(_ elements: [Element], _ compareHandler: @escaping (Int, Int) -> Bool) {
    self.elements = elements
    self.compareHandler = compareHandler
    ajust()
  }
  
 mutating func ajust() {
    for i in (0...(elements.count / 2 - 1)).reversed() {
      ajustNode(i)
    }
  }
  
  mutating func ajustNode(_ pos: Int) {
    func compare(_ p1: Int, _ p2: Int, _ completeHandler: () -> ()) {
      if compareHandler(p1, p2) {
        elements.swapAt(p1, p2)
        completeHandler()
      }
    }
    
    let left = 2 * pos + 1
    let right = 2 * pos + 2
    guard left < elements.count else { return }
    guard right < elements.count else {
      compare(left, pos) { self.ajustNode(left) }
      return
    }
    
    if elements[left] > elements[right] {
      compare(left, pos) { self.ajustNode(left) }
    } else {
      compare(right, pos) { self.ajustNode(right) }
    }
  }
}
