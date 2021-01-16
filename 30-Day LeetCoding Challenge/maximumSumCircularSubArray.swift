//
//  MaximumSumCircularSubArray.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/1/16.
//

import Foundation

class MaximumSumCircularSubArray {
    
    func maxSubarraySumCircular(_ A: [Int]) -> Int {
        var sum = 0
        var maxLast = Int.min
        var maxAns = Int.min
        
        var minLast = Int.max
        var minAns = Int.max

        for num in A {
            sum += num
            if maxLast < 0 {
                maxLast = num
            } else {
                maxLast += num
            }
            
            if minLast > 0 {
                minLast = num
            } else {
                minLast += num
            }
            minAns = min(minAns, minLast)
            maxAns = max(maxAns, maxLast)
        }

        return maxAns < 0 ? maxAns : max(sum - minAns, maxAns)
    }
    
    func test() {
        print(maxSubarraySumCircular([-2,-3,-1]))
//        print(maxSubarraySumCircular([1,-2,3,-2]))
//        print(maxSubarraySumCircular([5,-3,5]))
//        print(maxSubarraySumCircular([3,-1,2,-1]))
//        print(maxSubarraySumCircular([3,-2,2,-3]))
    }
    
}
