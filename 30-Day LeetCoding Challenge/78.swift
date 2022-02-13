//
//  78.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/2/13.
//

import Foundation

/**
 78. Subsets
 https://leetcode.com/problems/subsets/
 
 给定一个数组，求出所有子数组的组合。这题我们可以在子数组上不断新增数字，就能产生新的子数组，比如，初始为[]，
 然后第一个元素是1，则子数组变为：[] + [1], 接着是数字2，那么子数组变为了：
 ([] + [1]) + ([] + [1]) * [2] = ([], [1], [2], [1,2])，以此类推就可以得到所有的组合。
 */

class Leetcode78 {
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        return nums.reduce([[]]) { (result, num) in
            return result + result.map { $0 + [num] }
        }
    }
    
    func test() {
        print(subsets([1,2,3]))
    }
}
