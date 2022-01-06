//
//  1094.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/1/6.
//

import Foundation

class Leetcode1094 {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var allLocations = Array(repeating: 0, count: 1001)
        for trip in trips {
            for j in trip[1]...trip[2] {
                allLocations[j] += trip[0]
                if allLocations[j] > capacity {
                    return false
                }
            }
        }
        return true
    }
}
