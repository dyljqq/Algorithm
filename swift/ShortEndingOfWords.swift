//
//  ShortEndingOfWords.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/28.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class ShortEndingOfWords {
  
  class TrieNode {
    
    var isEnd = false
    var child: [Character:TrieNode] = [:]
    
    init() {
      
    }
    
  }
  
  class Trie {
    
    let root = TrieNode()
    
    func insert(_ word: [Character]) -> Int {
      guard !word.isEmpty else {
        return 0
      }
      var isNew = false
      var node = root
      for w in word {
        if node.child[w] == nil {
          isNew = true
          node.child[w] = TrieNode()
        }
        node = node.child[w]!
      }
      node.isEnd = true
      return isNew ? word.count + 1 : 0
    }
    
  }
  
  func minimumLengthEncoding(_ words: [String]) -> Int {
    guard !words.isEmpty else { return 0 }
    
    let trie = Trie()
    var total = 0
    
    let words = words.sorted { $0.count > $1.count }
    for w in words {
      total += trie.insert(Array(w).reversed())
    }
    return total
  }
  
  func test() {
    print(minimumLengthEncoding(["time", "me", "bell"]))
  }
  
}
