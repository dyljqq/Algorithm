//
//  260.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/31.
//

import Foundation

class Solution260 {
//    func singleNumber(_ nums: [Int]) -> [Int] {
//        var hash: [Int: Int] = [:]
//        nums.forEach {
//            if hash[$0, default: 0] == 1 {
//                hash[$0] = 0
//            } else {
//                hash[$0] = 1
//            }
//        }
//        return hash.filter { $0.value == 1 }.map { $0.key }
//    }
    
    func singleNumber(_ nums: [Int]) -> [Int] {
        var xor = nums.reduce(0, ^)
        xor = xor & -xor
        var result = [0, 0]
        for num in nums {
            if xor & num != 0 {
                result[0] ^= num
            } else {
                result[1] ^= num
            }
        }
        return result
    }
    
    func test() {
        print(singleNumber([1,2,1,3,2,5]))
        print(singleNumber([-1,0]))
        print(singleNumber([0,1]))
    }
}
