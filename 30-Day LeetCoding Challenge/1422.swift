//
//  1422.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/22.
//

import Foundation

class Solution1422 {
//    func maxScore(_ s: String) -> Int {
//        let numOfZero = s.reduce(0) { $0 + ($1 == "0" ? 1 : 0) }
//        let s = Array(s)
//        var mx = 0
//        var dp = Array(repeating: 0, count: s.count + 1)
//        for i in 0..<(s.count - 1) {
//            dp[i + 1] = dp[i] + (s[i] == "0" ? 1 : 0)
//            mx = max(mx, dp[i + 1] + (s.count - i - 1 - (numOfZero - dp[i + 1])))
//        }
//        return mx
//    }
    
    func maxScore(_ s: String) -> Int {
        var numOfZero = 0
        var numOfOne = s.reduce(0) { $0 + ($1 == "1" ? 1 : 0) }
        var mx = 0
        for ch in s.dropLast() {
            if ch == "0" {
                numOfZero += 1
            } else {
                numOfOne -= 1
            }
            mx = max(mx, numOfOne + numOfZero)
        }
        return mx
    }
    
    func test() {
        print(maxScore("011101"))
        print(maxScore("00111"))
        print(maxScore("00"))
    }
}
