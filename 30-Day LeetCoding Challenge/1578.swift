//
//  1578.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/27.
//

import Foundation

class Solution1578 {
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        var maxNeedTime = neededTime[0]
        var ans = 0
        let colors = Array(colors)
        for i in 1..<colors.count {
            if colors[i] == colors[i - 1] {
                ans += min(maxNeedTime, neededTime[i])
                maxNeedTime = max(neededTime[i], maxNeedTime)
            } else {
                maxNeedTime = neededTime[i]
            }
        }
        return ans
    }
    
    func test() {
        print(minCost("aabaa", [1,2,3,4,1]))
        print(minCost("abaac", [1,2,3,4,5]))
        print(minCost("abc", [1,2,3]))
        print(minCost("bbbaaa", [4,9,3,8,8,9]))
    }
}
