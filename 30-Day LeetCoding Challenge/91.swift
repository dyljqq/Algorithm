//
//  91.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/25.
//

import Foundation

class Solution91 {
    
    func isValid(_ s: String) -> Bool {
        guard let value = Int(s) else { return false }
        return value >= 1 && value <= 26
    }
    
    func numDecodings(_ s: String) -> Int {
        let arr = Array(s)
        guard !arr.isEmpty, arr[0] != "0" else { return 0 }
        var dp = Array(repeating: 0, count: s.count + 1)
        dp[0] = 1
        for i in 1..<dp.count {
            dp[i] = arr[i - 1] == "0" ? 0 : dp[i - 1]
            if i > 1, (arr[i - 2] == "1" || (arr[i - 2] == "2" && arr[i - 1] <= "6")) {
                dp[i] += dp[i - 2]
            }
        }
        return dp[s.count]
    }
    
    func test() {
        print(numDecodings("12"))
        print(numDecodings("226"))
        print(numDecodings("06"))
    }
}
