//
//  2244.swift
//  Leetcode
//
//  Created by polaris dev on 2023/1/4.
//

import Foundation

class Leetcode2244 {
    func minimumRounds(_ tasks: [Int]) -> Int {
        var hash: [Int: Int] = [:]
        tasks.forEach { hash[$0, default: 0] += 1 }
        var sum = 0
        for value in hash.values {
            guard value > 1 else { return -1 }
            sum += (value + 2) / 3
        }
        return sum
    }
    
    func test() {
        print(minimumRounds([2,2,3,3,2,4,4,4,4,4]))
        print(minimumRounds([2,3,3]))
    }
}
