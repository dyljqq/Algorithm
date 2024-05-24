//
//  1255.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/24.
//

import Foundation

class Solution1255 {
    
    func dfs(_ words: [String], _ hash: [Character: Int],  _ score: [Int], _ index: Int) -> Int {
        var res = 0, hash = hash
        for i in index..<words.count {
            var sum = 0, isValid = true
            for ch in words[i] {
                if let value = hash[ch], value > 0 {
                    let v = Int(ch.asciiValue! - Character("a").asciiValue!)
                    sum += score[v]
                } else {
                    isValid = false
                }
                hash[ch, default: 0] -= 1
            }
            
            if isValid {
                sum += dfs(words, hash, score, i + 1)
                res = max(sum, res)
            }
            
            for ch in words[i] {
                hash[ch, default: 0] += 1
            }
        }
        
        return res
    }
    
    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        var hash: [Character: Int] = [:]
        letters.forEach { hash[$0, default: 0] += 1 }
        return dfs(words, hash, score, 0)
    }
    
    func test() {
        print(maxScoreWords(["dog","cat","dad","good"], ["a","a","c","d","d","d","g","o","o"], [1,0,9,5,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0]))
        print(maxScoreWords(["xxxz","ax","bx","cx"], ["z","a","b","c","x","x","x"], [4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,10]))
        print(maxScoreWords(["leetcode"], ["l","e","t","c","o","d"], [0,0,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0]))
    }
    
}
