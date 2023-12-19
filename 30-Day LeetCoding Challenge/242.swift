//
//  242.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/16.
//

import Foundation

class Solution242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var hash: [Character: Int] = [:]
        s.forEach { hash[$0, default: 0] += 1 }
        for ch in t {
            if let value = hash[ch], value > 0 {
                hash[ch] = value - 1
            } else {
                return false
            }
        }
        return true
    }
    
    func test() {
        print(isAnagram("anagram", "nagaram"))
        print(isAnagram("rat", "car"))
    }
}
