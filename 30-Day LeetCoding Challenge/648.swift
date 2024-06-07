//
//  648.swift
//  Leetcode
//
//  Created by polaris dev on 2024/6/7.
//

import Foundation

//In English, we have a concept called root, which can be followed by some other word to form another longer word - let's call this word derivative. For example, when the root "help" is followed by the word "ful", we can form a derivative "helpful".
//
//Given a dictionary consisting of many roots and a sentence consisting of words separated by spaces, replace all the derivatives in the sentence with the root forming it. If a derivative can be replaced by more than one root, replace it with the root that has the shortest length.
//
//Return the sentence after the replacement.
//
// 
//
//Example 1:
//
//Input: dictionary = ["cat","bat","rat"], sentence = "the cattle was rattled by the battery"
//Output: "the cat was rat by the bat"
//Example 2:
//
//Input: dictionary = ["a","b","c"], sentence = "aadsfasf absbs bbab cadsfafs"
//Output: "a a b c"

class Solution648 {
    
    class Trie {
        var children: [Character: Trie] = [:]
        var wordEnd: Bool = false
    }
    
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        var root = Trie()
        for d in dictionary {
            var node = root
            for c in d {
                if node.children[c] == nil {
                    node.children[c] = Trie()
                }
                node = node.children[c]!
            }
            node.wordEnd = true
        }
        
        var words = sentence.split(separator: " ")
        for (i, word) in words.enumerated() {
            var node = root
            var new = ""
            for c in word {
                if node.children[c] == nil || node.wordEnd {
                    break
                }
                new += String(c)
                node = node.children[c]!
            }
            if node.wordEnd {
                words[i] = Substring(new)
            }
        }
        
        return words.joined(separator: " ")
    }
}
