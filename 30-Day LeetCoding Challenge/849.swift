//
//  849.swift
//  Leetcode
//
//  Created by 季勤强 on 16-01-22.
//

import Foundation

class Leetcode849 {
    
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var zeroNum = 0, r = Int.min, oneNum = 0
        for seat in seats {
            if seat == 1 {
                oneNum += 1
                if oneNum == 1 {
                    r = zeroNum
                } else {
                    r = max(r, (zeroNum + 1) / 2)
                }
                zeroNum = 0
            } else {
                zeroNum += 1
            }
        }
        return seats.last! == 0 ? max(r, zeroNum) : max(r, (zeroNum + 1) / 2)
    }
    
    func test() {
        let rs = [
            [1,0,0,0,1,0,1],
            [1,0,0,0],
            [0,1],
            [0,0,1],
            [0,1,1,1,0,0,1,0,0]
        ]
        
        for r in rs {
            print(maxDistToClosest(r))
        }
    }
    
}
