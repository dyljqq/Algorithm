//
//  1122.swift
//  Leetcode
//
//  Created by polaris dev on 2024/6/11.
//

import Foundation

class Solution1122 {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var h1: [Int: Int] = [:]
        arr1.forEach { h1[$0, default: 0] += 1 }
        
        var rs: [Int] = []
        for num in arr2 {
            if let value = h1[num] {
                rs.append(contentsOf: (0..<value).map { _ in num})
            }
        }
        var h2: [Int: Int] = [:], unused: [Int] = []
        arr2.forEach { h2[$0, default: 0] += 1 }
        for num in arr1 {
            if h2[num] == nil {
                unused.append(num)
            }
        }
        unused = unused.sorted()
        return rs + unused
    }
}
