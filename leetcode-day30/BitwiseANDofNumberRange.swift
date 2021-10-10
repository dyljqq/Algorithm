//
//  BitwiseANDofNumberRange.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/10.
//

import Foundation

class BitwiseANDofNumberRange {
    
    // Brian Kernighan 算法
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var right = right
        while left < right {
            right = right & (right - 1)
        }
        return right
    }
    
}
