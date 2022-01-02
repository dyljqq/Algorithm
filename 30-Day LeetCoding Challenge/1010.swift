//
//  1010.swift
//  Leetcode
//
//  Created by 季勤强 on 03-01-22.
//

import Foundation

class Leetcode1010 {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var ans = 0
        var arr = Array(repeating: 0, count: 61)
        for t in time {
            let a = t % 60
            ans += arr[(60 - a) % 60]
            arr[a] += 1
        }
        return ans
    }
}
