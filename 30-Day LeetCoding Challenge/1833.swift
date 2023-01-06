//
//  1833.swift
//  Leetcode
//
//  Created by polaris dev on 2023/1/6.
//

import Foundation

class Leetcode1833 {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        let costs = costs.sorted()
        var coins = coins, cnt = 0
        for cost in costs {
            guard coins >= 0 else { break }
            if coins >= cost {
                coins -= cost
                cnt += 1
            }
        }
        return cnt
    }
    
    func test() {
        print(maxIceCream([1,3,2,4,1], 7))
        print(maxIceCream([10,6,8,7,7,8], 5))
        print(maxIceCream([1,6,3,1,2,5], 20))
    }
}
