//
//  2706.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/20.
//

import Foundation

class Solution2706 {
    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        var mn1 = Int.max, mn2 = Int.max
        for price in prices {
            if price < mn1 {
                if price < mn2 {
                    mn1 = mn2
                    mn2 = price
                } else {
                    mn1 = price
                }
            }
        }
        let left = money - mn1 - mn2
        return left >= 0 ? left : money
    }
    
    func test() {
        print(buyChoco([1, 2, 2], 3))
        print(buyChoco([3,2,3], 3))
        print(buyChoco([98,54,6,34,66,63,52,39], 62))
    }
}
