//
//  668.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/16.
//

import Foundation

/// https://leetcode.com/problems/kth-smallest-number-in-multiplication-table/
class Leetcode668 {
    
    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var left = 1, right = m * n + 1
        while left < right {
            let mid = (left + right) / 2
            var count = 0
            for i in 1...n {
                let a = mid / i
                guard a > 0 && count < k else {
                    break
                }
                count += min(a, m)
            }
            if count < k {
               left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    func test() {
        print(findKthNumber(3, 3, 5))
        print(findKthNumber(2, 3, 6))
    }
    
}
