//
//  1160.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/2.
//

import Foundation

class Leetcode1160 {
    
    func find(word: String, in chars: String) -> Bool {
        var hash: [Character: Int] = [:]
        chars.forEach { hash[$0, default: 0] += 1 }
        
        for ch in word {
            if let value = hash[ch], value > 0 {
                hash[ch] = value - 1
            } else {
                return false
            }
        }
        return true
    }
    
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        return words.reduce(0) { $0 + (find(word: $1, in: chars) ? $1.count : 0) }
    }
}
