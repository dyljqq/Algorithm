//
//  1863.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/20.
//

import Foundation

class Solution1863 {
    
    struct Result {
        let nums: [Int]
        let value: Int
    }
    
    func getSubArrays(_ nums: [Int], _ total: inout Int) -> [Result] {
        guard !nums.isEmpty else { return [] }
        var rs: [Result] = []
        let head = nums[0]
        let subArrays = getSubArrays(Array(nums[1..<nums.count]), &total)
        rs.append(contentsOf: subArrays)
        rs.append(Result(nums: [head], value: head))
        total += head
        for array in subArrays {
            let r = array.value ^ head
            total += r
            rs.append(Result(nums: [head] + array.nums, value: r))
        }
        return rs
    }
    
    func subsetXORSum(_ nums: [Int]) -> Int {
        var total = 0
        getSubArrays(nums, &total)
        return total
    }
    
    func test() {
        print(subsetXORSum([5,1,6]))
        print(subsetXORSum([3,4,5,6,7,8]))
    }
}
