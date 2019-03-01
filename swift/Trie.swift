//
//  Trie.swift
//  LeetCode
//
//  Created by 季勤强 on 2019/3/1.
//  Copyright © 2019 dyljqq. All rights reserved.
//

import Foundation

class Trie {
  
  class TrieNode {
    var child: [Character: TrieNode]
    var isEnd: Bool
    
    init() {
      self.child = [:]
      self.isEnd = false
    }
  }
  
  let root: TrieNode
  
  /** Initialize your data structure here. */
  init() {
    self.root = TrieNode()
  }
  
  /** Inserts a word into the trie. */
  func insert(_ word: String) {
    guard word.count > 0 else {
      return
    }

    var node = self.root
    for w in word {
      if node.child[w] == nil {
        node.child[w] = TrieNode()
      }
      node = node.child[w]!
    }
    node.isEnd = true
  }
  
  /** Returns if the word is in the trie. */
  func search(_ word: String) -> Bool {
    guard word.count > 0 else {
      return false
    }
    guard let node = searchPrefix(Array(word)) else {
      return false
    }
    return node.isEnd
  }
  
  /** Returns if there is any word in the trie that starts with the given prefix. */
  func startsWith(_ prefix: String) -> Bool {
    return searchPrefix(Array(prefix)) != nil
  }
  
  func searchPrefix(_ word: [Character]) -> TrieNode? {
    var node = self.root
    for c in word {
      if node.child[c] == nil {
        return nil
      }
      node = node.child[c]!
    }
    return node
  }
  
  func test() {
    let trie = Trie()
    
//    trie.insert("apple");
//    print(trie.search("apple"))   // returns true
//    print(trie.search("app"))   // returns false
//    print(trie.startsWith("app")) // returns true
//    trie.insert("app");
//    print(trie.search("app"))     // returns true
    
//    ["Trie","insert","search","search","search","startsWith","startsWith","startsWith"]
//    [[],["hello"],["hell"],["helloa"],["hello"],["hell"],["helloa"],["hello"]]
    
    trie.insert("hello")
    print(trie.search("hell"))
    print(trie.search("helloa"))
    print(trie.search("hello"))
    print(trie.startsWith("hell"))
    print(trie.startsWith("helloa"))
    print(trie.startsWith("hello"))
  }
}
