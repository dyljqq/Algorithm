//
//  560.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/2/10.
//

import Foundation

/**
 560. Subarray Sum Equals K
 https://leetcode.com/problems/subarray-sum-equals-k/

 题目是说，从给定的一个数组中，找到一个连续的子数组，它的和等于k。
 
 解法1:
 了解题目的意思之后，我们想当然的会想到，我可以构造一个二维数组dp，使得dp[i][j] == k, 表示i-j这个子数组的值。遍历一遍之后，统计等于k的子数组的个数即可。
 
 但是显然这个不太符合我们的预期，有点过于暴力了。那么我们能不能做点优化呢，那当然可以啊。
 
 解法2:
 
 从上面我们可以知道i-j的数组的值，其实是不是就等于0-j的值减去0~(i-1)的数组的值呢？即:
 
 dp[i][j] = dp[0][j] - dp[0][i-1]
 
 那么是不是就能优化成一个一维数组arr，这个数值记录了数组的累加值。但是这个时间复杂度为O(n^2),虽然过了OJ，但是依然肯定有还能优化的地方。
 
 解法3:
 
 我们转化下思路，我们定义一个hash字典，去存储各个数字的累加和，记为sum，那么如果sum - k有值，则表示存在一个下标i，使得i-j的值为k，则sum - k就表示0-i的值，j为当前的num的下标值。这样直接降维成了O(n)。
 
 **/

class Leetcode560 {
//    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
//        var dp = Array(repeating: 0, count: nums.count)
//        for (i, num) in nums.enumerated() {
//            dp[i] = i > 0 ? (dp[i - 1] + num) : num
//        }
//
//        var total = 0
//        for i in 0..<nums.count {
//            for j in i..<nums.count {
//                let diff = j > i ? (dp[j] - dp[i]) : dp[i]
//                if diff == k {
//                    total += 1
//                }
//            }
//        }
//        return total
//    }
    
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var hash: [Int: Int] = [0:1]
        var sum = 0, res = 0
        for num in nums {
            sum += num
            res += hash[sum - k, default: 0]
            hash[sum, default: 0] += 1
        }
        return res
    }
    
    func test() {
        print(subarraySum([1,1,1], 2))
        print(subarraySum([1,2,3], 3))
    }
}
