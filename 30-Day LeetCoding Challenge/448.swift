//
//  448.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/18.
//

import Foundation

class Leedcode448 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var newNums = Array(repeating: -1, count: nums.count + 1)
        for num in nums {
            newNums[num] = num + 1
        }

        var rs: [Int] = []
        for (index, num) in newNums.enumerated() {
            if index > 0 && num == -1 {
                rs.append(index)
            }
        }
        return rs
    }
    
    func test() {
        print(findDisappearedNumbers([4,3,2,7,8,2,3,1]))
        print(findDisappearedNumbers([1, 1]))
    }
}
