//
//  739.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/13.
//

import Foundation

// 739. Daily Temperatures
// https://leetcode.com/problems/daily-temperatures/
class Leetcode739 {
    
    // 使用递减栈
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var rs: [Int] = Array(repeating: 0, count: temperatures.count)
        var stack = [(Int, Int)]()
        
        for (index, item) in temperatures.enumerated() {
            while let last = stack.last, last.1 < item {
                rs[last.0] = index - last.0
                stack.popLast()
            }
            stack.append((index, item))
        }
        return rs
    }
    
    func test() {
        print(dailyTemperatures([73,74,75,71,69,72,76,73]))
    }
    
}
