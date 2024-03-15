//
//  238.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/15.
//

import Foundation

class Solution238 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var zeroNum = 0
        var r = 1, arr: [Int] = []
        for num in nums {
            if num == 0 {
                zeroNum += 1
            } else {
                r = r * num
            }
            
            if zeroNum > 1 {
                return (0..<nums.count).map { _ in 0 }
            }
        }
        
        for num in nums {
            if num == 0 {
                arr.append(r)
            } else if zeroNum == 1 {
                arr.append(0)
            } else {
                arr.append(r / num)
            }
        }
        return arr
    }
}
