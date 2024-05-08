//
//  506.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/8.
//

import Foundation

//506. Relative Ranks

//You are given an integer array score of size n, where score[i] is the score of the ith athlete in a competition. All the scores are guaranteed to be unique.
//
//The athletes are placed based on their scores, where the 1st place athlete has the highest score, the 2nd place athlete has the 2nd highest score, and so on. The placement of each athlete determines their rank:
//
//The 1st place athlete's rank is "Gold Medal".
//The 2nd place athlete's rank is "Silver Medal".
//The 3rd place athlete's rank is "Bronze Medal".
//For the 4th place to the nth place athlete, their rank is their placement number (i.e., the xth place athlete's rank is "x").
//Return an array answer of size n where answer[i] is the rank of the ith athlete.


//Input: score = [5,4,3,2,1]
//Output: ["Gold Medal","Silver Medal","Bronze Medal","4","5"]
//Explanation: The placements are [1st, 2nd, 3rd, 4th, 5th].

//Input: score = [10,3,8,9,4]
//Output: ["Gold Medal","5","Bronze Medal","Silver Medal","4"]
//Explanation: The placements are [1st, 5th, 3rd, 2nd, 4th].

class Solution506 {
    func findRelativeRanks(_ score: [Int]) -> [String] {
        let scores = score.sorted { $0 > $1 }
        var hash: [Int: Int] = [:]
        scores.enumerated().forEach { hash[$1] = $0 }
        
        var results: [String] = []
        for value in score {
            guard let rank = hash[value] else {
                continue
            }
            if rank == 0 {
                results.append("Gold Medal")
            } else if rank == 1 {
                results.append("Silver Medal")
            } else if rank == 2 {
                results.append("Bronze Medal")
            } else {
                results.append("\(rank + 1)")
            }
        }
        return results
    }
    
    func test() {
        print(findRelativeRanks([5,4,3,2,1]))
        print(findRelativeRanks([10,3,8,9,4]))
    }
}
