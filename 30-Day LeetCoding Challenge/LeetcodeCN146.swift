//
//  LeetcodeCN146.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/12.
//

import Foundation

class LeetcodeCN146 {
  
  class Node {
    let key: Int
    var val: Int
    var prev: Node?
    var next: Node?
    
    init(key: Int, val: Int) {
      self.key = key
      self.val = val
      self.prev = nil
      self.next = nil
    }
  }
  
  let capacity: Int
  
  let head: Node = Node(key: 0, val: 0)
  let tail: Node = Node(key: 0, val: 0)

  var size: Int = 0
  var cache: [Int: Node] = [:]
  
  init(_ capacity: Int) {
    self.capacity = capacity
    head.next = tail
    tail.prev = head
  }
  
  func get(_ key: Int) -> Int {
    guard let node = cache[key] else { return -1 }
    remove(node: node)
    moveToHead(node: node)
    return node.val
  }
  
  func put(_ key: Int, _ value: Int) {
    if let node = cache[key] {
      node.val = value
      moveToHead(node: node)
    } else {
      let newNode = Node(key: key, val: value)
      addToHead(node: newNode)
      size = size + 1
      cache[key] = newNode
      
      if size > capacity {
        if let tail = removeTail() {
          cache[tail.key] = nil
        }
        size = size - 1
      }
    }
  }
  
  func addToHead(node: Node) {
    node.next = head.next
    node.prev = head
    head.next?.prev = node
    head.next = node
  }
  
  func remove(node: Node) {
    node.prev?.next = node.next
    node.next?.prev = node.prev
  }
  
  func removeTail() -> Node? {
    if let node = tail.prev, node.prev != nil {
      remove(node: node)
      return node
    }
    return nil
  }
  
  func moveToHead(node: Node) {
    remove(node: node)
    addToHead(node: node)
  }
  
  static func test() {
//    ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
// ["LRUCache","get","put","get","put","put","get","get"]
//    [[2],[2],[2,6],[1],[1,5],[1,2],[1],[2]]
    var lru = LeetcodeCN146(2)
    print(lru.get(2))
    lru.put(2, 6)
    print(lru.get(1))
    lru.put(1, 5)
    lru.put(1, 2)
    print(lru.get(1))
    print(lru.get(2))
    print("-------------")
    
//    ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
//    [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
    // [null, null, null, 1, null, -1, null, -1, 3, 4]
    lru = LeetcodeCN146(2)
    lru.put(1, 1)
    lru.put(2, 2)
    print(lru.get(1))
    lru.put(3, 3)
    print(lru.get(2))
    lru.put(4, 4)
    print(lru.get(1))
    print(lru.get(3))
    print(lru.get(4))
  }
}
