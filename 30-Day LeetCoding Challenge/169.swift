//
//  169.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/2/21.
//

import Foundation

/**
 169. Majority Element
 https://leetcode.com/problems/majority-element/
 
 这是一道比较简单的题目，大概就是说找到数组中超过一半的数字。因此第一想到的就是通过字典去存取对应数字出现的数字，如果超过半数的话，就返回结果。
 
 还有一种方法是通过摩尔投票的算法，前提是一定有个数字是超过半数的。将这个数字跟非该数字分为两堆，相互抵消后，剩下的元素就是我们要投票的数字了。
 */
class Leetcode169 {
    
    // Soulution 1
//    func majorityElement(_ nums: [Int]) -> Int {
//        var hash: [Int: Int] = [:]
//        let threshold = nums.count / 2 + 1
//        for num in nums {
//            hash[num, default: 0] += 1
//            if hash[num]! >= threshold {
//                return num
//            }
//        }
//        return 0
//    }
    
    // Solution 2
    func majorityElement(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var vote = nums[0], count = 1
        for num in nums.dropFirst() {
            if vote == num {
                count += 1
            } else {
                count -= 1
                if count == 0 {
                    vote = num
                    count = 1
                }
            }
        }
        return vote
    }
    
}
