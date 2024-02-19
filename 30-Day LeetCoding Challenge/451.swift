//
//  451.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/7.
//

import Foundation

class Solution451 {
    func frequencySort(_ s: String) -> String {
        var hash: [String.Element: (String.Element, Int)] = [:]
        s.forEach { ch in
            let value = hash[ch, default: (ch, 0)]
            hash[ch] = (ch, value.1 + 1)
        }
        let values = hash.values.sorted { $0.1 > $1.1 }
        return values.reduce("") { result, value in
            result + String((0..<value.1).map { _ in value.0 })
        }
    }
    
    func test() {
        print(frequencySort("tree"))
        print(frequencySort("cccaaa"))
        print(frequencySort("Aabb"))
    }
}
