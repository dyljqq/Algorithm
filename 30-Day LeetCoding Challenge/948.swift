//
//  948.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/4.
//

import Foundation

class Solution948 {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        let tokens = tokens.sorted()
        var p = 0, q = tokens.count - 1
        var power = power, point = 0, res = 0
        while p <= q {
            if tokens[p] <= power {
                power -= tokens[p]
                point += 1
                p = p + 1
            } else if point >= 1 {
                point -= 1
                power += tokens[q]
                q = q - 1
            } else {
                break
            }
            res = max(res, point)
        }
        return res
    }
    
    func test() {
        print(bagOfTokensScore([100,200,300,400], 200))
    }
}
