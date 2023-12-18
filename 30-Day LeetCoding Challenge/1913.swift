//
//  1913.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/18.
//

import Foundation

class Solution1913 {
    
    func maxProductDifference(_ nums: [Int]) -> Int {
        var mxHeap = Array(repeating: 0, count: 2)
        var mnHeap = Array(repeating: Int.max, count: 2)
        
        for num in nums {
            if num > mxHeap[1] {
                if num > mxHeap[0] {
                    mxHeap[1] = mxHeap[0]
                    mxHeap[0] = num
                } else {
                    mxHeap[1] = num
                }
            }
            if num < mnHeap[1] {
                if num < mnHeap[0] {
                    mnHeap[1] = mnHeap[0]
                    mnHeap[0] = num
                } else {
                    mnHeap[1] = num
                }
            }
        }
        return (mxHeap[0] * mxHeap[1]) - (mnHeap[0] * mnHeap[1])
    }
    
    func test() {
        print(maxProductDifference([5,6,2,7,4]))
        print(maxProductDifference([4,2,5,9,7,4,8]))
    }
}
