//
//  387.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/5.
//

import Foundation

class Solution387 {
    func firstUniqChar(_ s: String) -> Int {
        var hash: [String.Element: Int] = [:]
        s.forEach { hash[$0, default: 0] += 1 }
        
        for (index, ch) in s.enumerated() {
            if let value = hash[ch], value == 1 {
                return index
            }
        }
        return -1
    }
    
    func test() {
        print(firstUniqChar("leetcode"))
        print(firstUniqChar("loveleetcode"))
        print(firstUniqChar("aabb"))
    }
}
