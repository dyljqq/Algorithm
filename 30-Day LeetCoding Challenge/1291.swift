//
//  1291.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/2.
//

import Foundation

class Solution1291 {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        let allPossible = (1...9).flatMap { start -> [Int] in
            var result = [Int]()
            var next = 0
            var n = start
            while next <= high && start < 10 && n < 10 {
                next = next * 10 + n
                if next >= low && next <= high {
                    result.append(next)
                }
                n += 1
            }
            return result
        }
        return allPossible.sorted()
    }
    
    func test() {
        print(sequentialDigits(100, 300))
        print(sequentialDigits(1000, 13000))
    }
}
