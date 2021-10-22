//
//  SortCharatersByFrequence.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/22.
//

import Foundation

class SortCharatersByFrequence {
    
    func frequencySort(_ s: String) -> String {
        var hash: [String.Element: Int] = [:]
        s.forEach { hash[$0, default: 0] += 1 }
        
        var rs: [Int: [String.Element]] = [:]
        for (key, value) in hash {
            rs[value, default: []].append(key)
        }
        
        var arr: [String.Element] = []
        for (key, value) in rs.sorted(by: { $1.key < $0.key }) {
            for ch in value {
                arr.append(contentsOf: (0..<key).map { _ in ch })
            }
        }
        
        return String(arr)
    }
    
    func test() {
        print(frequencySort("tree"))
        print(frequencySort("cccaaa"))
        print(frequencySort("Aabb"))
    }
    
}
