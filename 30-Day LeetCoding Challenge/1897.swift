//
//  1897.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/30.
//

import Foundation

class Solution1897 {
    
    func makeEqual(_ words: [String]) -> Bool {
        var hash: [Character: Int] = [:]
        for word in words {
            for ch in word {
                hash[ch, default: 0] += 1
            }
        }
        
        let n = words.count
        for value in hash.values {
            if value % n != 0 {
                return false
            }
        }
        return true
    }
    
    func test() {
        print(makeEqual(["abc","aabc","bc"]))
        print(makeEqual(["ab","a"]))
    }
    
}
