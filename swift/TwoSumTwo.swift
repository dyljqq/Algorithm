//
//  TwoSumTwo.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/9/26.
//

import Foundation

class TwoSumTwo {
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var hash = [Int: Int]()
        for index in 0..<numbers.count {
            if let r = hash[numbers[index]] {
                return [r + 1, index + 1]
            } else {
                hash[target - numbers[index]] = index
            }
        }
        return []
    }
    
}
