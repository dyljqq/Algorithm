//
//  SingleNumberIII.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/6.
//

import Foundation

class SingleNumberIII {
    
    func singleNumber(_ nums: [Int]) -> [Int] {
        var hash: [Int: Int] = [:]
        for num in nums {
            hash[num, default: 0] += 1
        }
        
        var rs: [Int] = []
        for (key, index) in hash {
            if index == 1 {
                rs.append(key)
            }
        }
        return rs
    }
    
}
