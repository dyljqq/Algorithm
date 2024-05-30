//
//  1442.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/30.
//

import Foundation

// We want to select three indices i, j and k where (0 <= i < j <= k < arr.length).
//Let's define a and b as follows:
//
//a = arr[i] ^ arr[i + 1] ^ ... ^ arr[j - 1]
//b = arr[j] ^ arr[j + 1] ^ ... ^ arr[k]
//Note that ^ denotes the bitwise-xor operation.
//
//Return the number of triplets (i, j and k) Where a == b.
class Solution1442 {
    func countTriplets(_ arr: [Int]) -> Int {
        var dp = Array(repeating: 0, count: arr.count + 1)
        for (index, num) in arr.enumerated() {
            dp[index + 1] = dp[index] ^ num
        }
        
        var cnt = 0
        for i in 0..<arr.count {
            for j in (i + 1)..<arr.count {
                if dp[j + 1] == dp[i] {
                    cnt += j - i
                }
            }
        }
        return cnt
    }
    
    
    func test() {
        print(countTriplets([2,3,1,6,7])) // The triplets are (0,1,2), (0,2,2), (2,3,4) and (2,4,4)
//        print(countTriplets([1,1,1,1,1]))
    }
    
}
