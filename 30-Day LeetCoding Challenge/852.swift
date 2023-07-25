//
//  852.swift
//  Leetcode
//
//  Created by polaris dev on 2023/7/25.
//

import Foundation

class Solution852 {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var p = 0, q = arr.count - 1
        while p < q {
            let mid = (p + q) / 2
            if arr[mid] > arr[mid + 1] {
                q = mid
            } else {
                p = mid + 1
            }
        }
        return p
    }
    
    func test() {
        print(peakIndexInMountainArray([0,1,0]))
        print(peakIndexInMountainArray([0,2,1,0]))
        print(peakIndexInMountainArray([0,10,5,2]))
    }
}
