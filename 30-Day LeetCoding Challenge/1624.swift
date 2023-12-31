//
//  1624.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/31.
//

import Foundation

class Solution1624 {
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var mx = -1
        var hash: [Character: Int] = [:]
        for (index, ch) in s.enumerated() {
            if let value = hash[ch] {
                mx = max(index - value - 1, mx)
            } else {
                hash[ch] = index
            }
        }
        return mx
    }
    
    func test() {
        print(maxLengthBetweenEqualCharacters("aa"))
        print(maxLengthBetweenEqualCharacters("abca"))
        print(maxLengthBetweenEqualCharacters("cbzxy"))
        print(maxLengthBetweenEqualCharacters("mgntdygtxrvxjnwksqhxuxtrv"))
    }
}
