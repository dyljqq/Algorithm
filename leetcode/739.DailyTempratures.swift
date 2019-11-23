//
//  DailyTempratures.swift
//  LeetCode
//
//  Created by 季勤强 on 2019/11/23.
//  Copyright © 2019 dyljqq. All rights reserved.
//

import Foundation

class DailyTempratures {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: T.count)
        var stack = [(Int, Int)]()
        
        for (index, item) in T.enumerated() {
            while !stack.isEmpty {
                let value = stack.last!.1
                guard item > value else {
                     break
                }
                let preIndex = stack.last!.0
                res[preIndex] = index - preIndex
                let _ = stack.popLast()
            }
            stack.append((index, item))
        }
        
        return res
    }
    
    func test() {
        let T = [73, 74, 75, 71, 69, 72, 76, 73]
        print(dailyTemperatures(T))
    }
}
