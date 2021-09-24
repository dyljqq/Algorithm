//
//  NThTribonacciNumber.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/9/24.
//

import Foundation

class NThTribonacciNumber {
    
    func tribonacci(_ n: Int) -> Int {
        var dp: [Int] = [0, 1, 1]
        var count = 3
        while count <= n {
            dp.append(dp[count - 3] + dp[count - 2] + dp[count - 1])
            count += 1
        }
        return dp[n]
    }
    
    func test() {
        print(tribonacci(4))
        print(tribonacci(25))
    }
    
}
