//
//  786.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/10.
//

import Foundation

class Solution786 {
    
// 统计 + 排序
//    struct Result {
//        let numerator: Int
//        let denominator: Int
//        let value: Double
//    }
//    
//    func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
//        var rs: [Result] = []
//        for i in 0..<arr.count {
//            for j in (i + 1)..<arr.count {
//                rs.append(Result(numerator: arr[i], denominator: arr[j], value: Double(arr[i]) / Double(arr[j])))
//            }
//        }
//        rs = rs.sorted { $0.value < $1.value }
//        let r = rs[min(k - 1, rs.count - 1)]
//        return [r.numerator, r.denominator]
//    }
    
    // 使用二分法
    func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
        var l = 0.0, r = 1.0
        var mid: Double
        var p = 0, q = 1
        var cnt = 0
        var j = 1
        while true {
            mid = l + (r - l) / 2
            cnt = 0
            p = 0
            j = 1
            for i in 0..<arr.count {
                while j < arr.count && Double(arr[i]) > mid * Double(arr[j]) {
                    j += 1
                }
                if j == arr.count { break }
                cnt += arr.count - j
                if arr[i] * q > p * arr[j] {
                    p = arr[i]
                    q = arr[j]
                }
            }
            if cnt == k {
                return [p, q]
            } else if cnt > k {
                r = mid
            } else {
                l = mid
            }
        }
    }
    
    func test() {
//        print(kthSmallestPrimeFraction([1,2,3,5], 3))
//        print(kthSmallestPrimeFraction([1,7], 1))
        print(kthSmallestPrimeFraction([1,7,23,29,47], 8)) // [23,47]
    }
}

//You are given a sorted integer array arr containing 1 and prime numbers, where all the integers of arr are unique. You are also given an integer k.
//
//For every i and j where 0 <= i < j < arr.length, we consider the fraction arr[i] / arr[j].
//
//Return the kth smallest fraction considered. Return your answer as an array of integers of size 2, where answer[0] == arr[i] and answer[1] == arr[j].
//
// 
//
//Example 1:
//
//Input: arr = [1,2,3,5], k = 3
//Output: [2,5]
//Explanation: The fractions to be considered in sorted order are:
//1/5, 1/3, 2/5, 1/2, 3/5, and 2/3.
//The third fraction is 2/5.
//Example 2:
//
//Input: arr = [1,7], k = 1
//Output: [1,7]
// 
//
//Constraints:
//
//2 <= arr.length <= 1000
//1 <= arr[i] <= 3 * 104
//arr[0] == 1
//arr[i] is a prime number for i > 0.
//All the numbers of arr are unique and sorted in strictly increasing order.
//1 <= k <= arr.length * (arr.length - 1) / 2
