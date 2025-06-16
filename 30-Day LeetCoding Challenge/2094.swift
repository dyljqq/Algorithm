//
//  2094.swift
//  Leetcode
//
//  Created by polaris dev on 2025/5/12.
//

import Foundation

class Solution2094 {
    
    func findEvenNumbers(_ digits: [Int]) -> [Int] {
        var hash: [Int: Int] = [:]
        digits.forEach { hash[$0, default: 0] += 1 }
        
        var results: [Int] = []
        for value in 100...999 where value % 2 == 0 {
            let h = value / 100
            let t = (value / 10) % 10
            let o = value % 10
            
            var tempHash = hash
            if let v = tempHash[h], v > 0 {
                tempHash[h] = v - 1
            } else {
                continue
            }
            
            if let v = tempHash[t], v > 0 {
                tempHash[t] = v - 1
            } else {
                continue
            }
            
            if let v = tempHash[o], v > 0 {
                results.append(value)
            }
            
        }
        
        return results
    }
    
    func test() {
        // [102,120,130,132,210,230,302,310,312,320]
        print(findEvenNumbers([2, 1, 3, 0]))
    }
}
