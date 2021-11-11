//
//  1413.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/11.
//

import Foundation

/// https://leetcode.com/problems/minimum-value-to-get-positive-step-by-step-sum/
class Leetcode1413 {
    
    func minStartValue(_ nums: [Int]) -> Int {
        var mn = Int.max, sum = 0
        for num in nums {
            sum += num
            if mn > sum {
                mn = sum
            }
        }
        return mn >= 0 ? 1 : (abs(mn) + 1)
    }
    
    func test() {
        print(minStartValue([2,3,5,-5,-1]))
        print(minStartValue([-3,2,-3,4,2]))
        print(minStartValue([1, 2]))
        print(minStartValue([1, -2, -3]))
    }
}
