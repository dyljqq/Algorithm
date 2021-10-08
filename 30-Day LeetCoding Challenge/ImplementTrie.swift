//
//  ImplementTrie.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/8.
//

import Foundation

class TrieNode {
    var character: Character
    var isWord: Bool
    var children: [TrieNode?]
    
    init(_ ch: Character) {
        self.character = ch
        self.isWord = false
        self.children = Array(repeating: nil, count: 26)
    }
}

class Trie {
    
    var root: TrieNode? = nil
    
    init() {
        root = TrieNode("\0")
    }
    
    func insert(_ word: String) {
        var cur = self.root
        for ch in word {
            let index = indexOf(ch)
            if cur?.children[index] == nil {
                cur?.children[index] = TrieNode(ch)
            }
            cur = cur?.children[index]
        }
        cur?.isWord = true
    }
    
    private func getNode(_ word: String) -> TrieNode? {
        var cur = root
        for ch in word {
            let index = indexOf(ch)
            if cur?.children[index] == nil {
                return nil
            }
            cur = cur?.children[index]
        }
        return cur
    }
    
    func search(_ word: String) -> Bool {
        guard let cur = getNode(word) else {
            return false
        }
        return cur.isWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        let node = getNode(prefix)
        return node != nil
    }
    
    private func indexOf(_ ch: Character) -> Int {
        return Int(ch.asciiValue! - Character("a").asciiValue!)
    }
}

class ImplementTrie {
    
    
    
}
