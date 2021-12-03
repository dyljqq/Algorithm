//
//  152.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/3.
//

import Foundation

class Leetcode152 {
    
    func helper(_ nums: [Int], _ ans: Int) -> Int {
        var prod = 1, ans = ans
        for num in nums {
            prod = prod * num
            ans = max(prod, ans)
            if num == 0 {
                prod = 1
            }
        }
        return ans
    }
    
    func maxProduct(_ nums: [Int]) -> Int {
        return helper(nums.reversed(), helper(nums, Int.min))
    }
}
