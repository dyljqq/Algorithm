//
//  1207.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/17.
//

import Foundation

class Solution1207 {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var hash: [Int: Int] = [:]
        for num in arr {
            hash[num, default: 0] += 1
        }
        let values = hash.values
        return values.count == Set(values).count
    }
}
