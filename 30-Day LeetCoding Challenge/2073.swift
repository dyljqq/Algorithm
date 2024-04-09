//
//  2073.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/9.
//

import Foundation

class Solution2073 {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        let value = tickets[k]
        var sum = 0
        for (i, ticket) in tickets.enumerated() {
            if i <= k {
                sum += min(value, ticket)
            } else {
                sum += min(value - 1, ticket)
            }
        }
        return sum
    }
    
    func test() {
        print(timeRequiredToBuy([2,3,2], 2))
        print(timeRequiredToBuy([5,1,1,1], 0))
        print(timeRequiredToBuy([84,49,5,24,70,77,87,8], 3))
    }
}
