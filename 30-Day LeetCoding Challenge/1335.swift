//
//  1335.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/29.
//

import Foundation

//You want to schedule a list of jobs in d days. Jobs are dependent (i.e To work on the ith job, you have to finish all the jobs j where 0 <= j < i).
//
//You have to finish at least one task every day. The difficulty of a job schedule is the sum of difficulties of each day of the d days. The difficulty of a day is the maximum difficulty of a job done on that day.
//
//You are given an integer array jobDifficulty and an integer d. The difficulty of the ith job is jobDifficulty[i].
//
//Return the minimum difficulty of a job schedule. If you cannot find a schedule for the jobs return -1.

class Solution1335 {
    
    // jobDifficulty = [6,5,4,3,2,1], d = 2
    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        let n = jobDifficulty.count
        guard d <= n else { return -1 }
        var dp = Array(repeating: Array(repeating: Int.max, count: n), count: d)
        dp[0][0] = jobDifficulty[0]
        for j in 1..<n {
            dp[0][j] = max(dp[0][j - 1], jobDifficulty[j])
        }
        for i in 1..<d {
            for j in i..<n {
                var mx = jobDifficulty[j]
                for k in stride(from: j, to: i - 1, by: -1) {
                    mx = max(mx, jobDifficulty[k])
                    dp[i][j] = min(dp[i][j], dp[i - 1][k - 1] + mx)
                }
            }
        }
        return dp[d - 1][n - 1]
    }
    
    func test() {
        print(minDifficulty([6,5,4,3,2,1], 2))
        print(minDifficulty([9,9,9], 4))
        print(minDifficulty([1,1,1], 3))
        print(minDifficulty([7,1,7,1,7,1], 3))
    }
}
