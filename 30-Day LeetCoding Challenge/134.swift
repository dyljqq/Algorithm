//
//  134.swift
//  Leetcode
//
//  Created by 季勤强 on 22-01-22.
//

import Foundation

class Leetcode134 {
    
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var start = 0, total = 0, sum = 0
        for i in 0..<gas.count {
            total += gas[i] - cost[i]
            sum += gas[i] - cost[i]
            if sum < 0 {
                start = i + 1
                sum = 0
            }
        }
        return total < 0 ? -1 : start
    }
    
}
