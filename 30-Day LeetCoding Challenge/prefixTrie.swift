//
//  prefixTrie.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/1/13.
//

import Foundation

class PrefixTrie {
    
    class TrieNode {
        var isEnd = false
        var child: [Character: TrieNode] = [:]
    }

    let trie: TrieNode
    
    init() {
        self.trie = TrieNode()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var root = self.trie
        for ch in word {
            if root.child[ch] == nil {
                root.child[ch] = TrieNode()
            }
            root = root.child[ch]!
        }
        root.isEnd = true
    }
    
    func _search(_ word: String, isSearchWord: Bool = true) -> Bool {
        guard !word.isEmpty else {
            return true
        }
        var root = self.trie
        for ch in word {
            if let trie = root.child[ch] {
                root = trie
            } else {
                return false
            }
        }
        return isSearchWord ? root.isEnd : true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        return self._search(word)
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        return self._search(prefix, isSearchWord: false)
    }
    
    func test() {
        self.insert("apple")
        print(search("app"))
        print(search("apple"))
        print(startsWith("app"))
        insert("app")
        print(search("app"))
    }
}
