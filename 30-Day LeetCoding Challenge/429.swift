//
//  429.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/5.
//

import Foundation

class Node {
  var val: Int
  var children: [Node]
  
  init(_ val: Int) {
    self.val = val
    self.children = []
  }
}

class Leetcode429 {
  
  func levelOrder(_ root: Node?) -> [[Int]] {
    var rs: [[Int]] = []
    var stack: [Node] = []
    if let root = root {
      stack.append(root)
    }
    
    while !stack.isEmpty {
      var ss: [Node] = []
      var r: [Int] = []
      for node in stack {
        r.append(node.val)
        for c in node.children {
          ss.append(c)
        }
      }
      stack = ss
      rs.append(r)
    }
    
    return rs
  }
  
}
