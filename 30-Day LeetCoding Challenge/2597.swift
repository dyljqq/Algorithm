//
//  2597.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/23.
//

import Foundation

class Solution2597 {
    func beautifulSubsets(_ nums: [Int], _ k: Int) -> Int {
        let subsets: [[Int]] = nums.reduce([[]]) { rs, value in
            var results: [[Int]] = rs
            for r in rs {
                var flag = true
                for v in r {
                    if abs(value - v) == k {
                        flag = false
                        break
                    }
                }
                if flag {
                    results.append([value] + r)
                }
            }
            return results
        }
        return subsets.count - 1
    }
    
    func test() {
        print(beautifulSubsets([2,4,6], 2))
        print(beautifulSubsets([1], 1))
    }
}
