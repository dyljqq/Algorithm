//
//  SortCharactersByFrenquence.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/2/22.
//

import Foundation

class SortCharactersByFrenquence {
    
    func frequencySort(_ s: String) -> String {
        
//        var d: [String.Element: Int] = [:]
//
//        s.map { d[$0] = (d[$0] ?? 0) + 1 }
//
//        var arr: [[String.Element]] = Array(repeating: [], count: s.count + 1)
//        for (key, value) in d {
//            arr[value].append(key)
//        }
//
//        var chs = [String.Element]()
//        for i in (0..<arr.count).reversed() {
//
//            if arr[i].isEmpty {
//                continue
//            }
//
//            for c in arr[i] {
//                for j in 0..<i {
//                    chs.append(c)
//                }
//            }
//
//        }
//        return String(chs)
        
        var m = [Character: Int]()
        for c in s {
            m[c, default: 0] += 1
        }
        return m.sorted { $0.value > $1.value }.map { String(repeating: $0.key, count: $0.value ) }.joined()
    }
    
    func test() {
        
        print(frequencySort("Aabb"))
        print(frequencySort("cccaaa"))
        print(frequencySort("tree"))
        print(frequencySort("eeeee"))
    }
    
}
