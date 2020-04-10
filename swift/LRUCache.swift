//
//  LRU.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/10.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LRUCache {
  
  class DNode {
    
    let key: Int
    var val: Int
    var pre: DNode? = nil
    var next: DNode? = nil
    
    init(_ key: Int, _ val: Int) {
      self.key = key
      self.val = val
    }
    
  }
  
  let capacity: Int
  var hash: [Int: DNode] = [:]
  
  var head: DNode
  var tail: DNode
  
  init(_ capacity: Int) {
    self.capacity = capacity
    
    head = DNode(-1, -1)
    tail = DNode(-1, -1)
    
    head.next = tail
    tail.pre = head
  }
  
  func addNode(_ node: DNode) {
    node.next = self.head.next
    if self.head.next === self.tail {
      self.tail.pre = node
    }
    self.head.next?.pre = node
    self.head.next = node
    node.pre = self.head
  }
  
  func removeLastNode(_ node: DNode) {
    if node === self.head {
      return
    }
    node.pre?.next = node.next
    node.next?.pre = node.pre
  }
  
  func get(_ key: Int) -> Int {
    guard let node = hash[key] else {
      return -1
    }
    removeLastNode(node)
    addNode(node)
    print(node.val)
    return node.val
  }
  
  func put(_ key: Int, _ value: Int) {
    if let node = hash[key] {
      node.val = value
      node.next?.pre = node.pre
      node.pre?.next = node.next
    } else if hash.count >= self.capacity {
      let lastNode = self.tail.pre!
      removeLastNode(lastNode)
      hash[lastNode.key] = nil
    }

    let node = DNode(key, value)
    hash[key] = node
    addNode(node)
  }
  
  class func test() {
    let cache = LRUCache(2)
    cache.get(2)
    cache.put(2, 6)
    cache.get(1)
    cache.put(1, 5)
    cache.put(1, 2)
    cache.get(1)
    cache.get(2)
  }
  
}
