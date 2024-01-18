//
//  70.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/18.
//

import Foundation

class Solution70 {
    func climbStairs(_ n: Int) -> Int {
        var f = Array(repeating: 0, count: 46)
        f[0] = 1
        for i in 1...45 {
            f[i] = i > 1 ? (f[i - 1] + f[i - 2]) : f[i - 1]
        }
        return f[n]
    }
}
