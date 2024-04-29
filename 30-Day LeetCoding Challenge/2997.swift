//
//  2997.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/29.
//

import Foundation

class Solution2997 {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var cnt = 0
        for num in nums {
            cnt = cnt ^ num
        }
        
        cnt = cnt ^ k
        var sum = 0
        while cnt > 0 {
            if cnt & 1 == 1 {
                sum += 1
            }
            cnt = cnt >> 1
        }
        
        return sum
    }
    
    func test() {
        print(minOperations([2,1,3,4], 1))
        print(minOperations([2,0,2,0], 0))
    }
}
