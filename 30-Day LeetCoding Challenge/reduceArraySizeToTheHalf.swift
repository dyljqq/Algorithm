//
//  reduceArraySizeToTheHalf.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/7.
//

import Foundation

class ReduceArraySizeToTheHalf {
    
    func minSetSize(_ arr: [Int]) -> Int {
        guard !arr.isEmpty else {
            return 0
        }
        var hash: [Int: Int] = [:]
        arr.forEach { hash[$0] = (hash[$0] ?? 0) + 1 }
        let values = hash.values.sorted(by: { $0 > $1 })
        
        var sum = 0
        for (index, value) in values.enumerated() {
            sum += value
            if sum >= (arr.count / 2) {
                return index + 1
            }
        }
        
        return 0
    }
    
    func test() {
        
        print(minSetSize([3,3,3,3,5,5,5,2,2,7]))
        print(minSetSize([7,7,7,7,7,7]))
        print(minSetSize([1,9]))
        print(minSetSize([1000,1000,3,7]))
        print(minSetSize([1,2,3,4,5,6,7,8,9,10]))
        
    }
    
}
