//
//  56.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/24.
//

import Foundation

class Leetcode56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var rs = [[Int]]()
        var r = intervals.first!
        
        for interval in intervals.dropFirst() {
            if r[1] >= interval[0] && r[1] <= interval[1] {
                r = [r[0], interval[1]]
            } else if r[1] < interval[0] {
                rs.append(r)
                r = interval
            }
        }
        rs.append(r)
        return rs
    }
    
    func test() {
        print(merge([[1,3],[2,6],[8,10],[9,18]]))
        print(merge([[1,4],[4,5]]))
    }
}
