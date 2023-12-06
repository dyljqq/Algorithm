//
//  1716.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/6.
//

import Foundation

class Solution1716 {
    func totalMoney(_ n: Int) -> Int {
        let values = Array(1...7)
        var total = 0
        for i in 1...n {
            let mul = (i - 1) / 7
            let remain = (i - 1) % 7
            total += values[remain] + mul
        }
        return total
    }
    
    func test() {
        print(totalMoney(4))
        print(totalMoney(10))
        print(totalMoney(20))
    }
}
