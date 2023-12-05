//
//  1688.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/5.
//

import Foundation

class Solution1688 {
    func numberOfMatches(_ n: Int) -> Int {
        var n = n
        var cnt = 0
        while n > 1 {
            if n % 2 == 0 {
                cnt += n / 2
                n = n / 2
            } else {
                cnt += (n - 1) / 2
                n = (n - 1) / 2 + 1
            }
        }
        return cnt
    }
    
    func test() {
        print(numberOfMatches(7))
        print(numberOfMatches(14))
    }
}
