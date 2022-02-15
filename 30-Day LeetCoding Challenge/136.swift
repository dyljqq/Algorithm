//
//  136.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/2/15.
//

import Foundation

/**
 136. Single Number
 https://leetcode.com/problems/single-number/
 
这题其实就是让你找到一个数组中，只出现一次的数字。常规做法，我们可以创建一个hash表，做统计，把只出现一次的给找出来。‘
 但是这题，我们可以通过异或的性质，对所有元素做异或操作，即相同的两个元素，异或的结果为0，那么最后的结果就是只出现一次的元素了。
 
 */

class Leetcode136 {
    
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0) { $0 ^ $1 }
    }
    
    func test() {
        print(singleNumber([2,2,1]))
        print(singleNumber([4,1,2,1,2]))
        print(singleNumber([1]))
    }
    
}
