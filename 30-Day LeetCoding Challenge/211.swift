//
//  211.swift
//  Leetcode
//
//  Created by 季勤强 on 28-01-22.
//

import Foundation

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEnd: Bool = false
}

class WordDictionary {

    var root: TrieNode
    
    init() {
      root = TrieNode()
    }
    
    func addWord(_ word: String) {
        var node = root
        for ch in word {
            if let next = node.children[ch] {
                node = next
            } else {
                let newNode = TrieNode()
                node.children[ch] = newNode
                node = newNode
            }
        }
        node.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        return self.match(Array(word), 0, self.root)
    }
    
    func match(_ chars: [Character], _ i: Int, _ node: TrieNode) -> Bool {
        if i == chars.count {
            return node.isEnd
        }
        
        let c = chars[i]
        if c != "." {
            guard let next = node.children[c] else {
                return false
            }
            return self.match(chars, i + 1, next)
        } else {
            for next in node.children.values {
                if self.match(chars, i + 1, next) {
                    return true
                }
            }
        }
        return false
    }
}
