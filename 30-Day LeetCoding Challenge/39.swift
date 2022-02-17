//
//  39.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/2/17.
//

import Foundation

/**
 39. Combination Sum
 https://leetcode.com/problems/combination-sum/
 
 这题其实就是要我们从数组中找出符合和为target的元素的子数组，注意，所使用的元素是可以重复的。
 
 思路其实很简单，就是我们不断的去试，使得和的值越来越接近给定的target，直到相等。代码如下：
 */

class Leetcode39 {
    
    func dfs(_ candidates: [Int], _ target: Int, _ index: Int, _ cur: inout [Int], _ ans: inout [[Int]]) {
        if target == 0 {
            ans.append(cur)
            return
        }
        
        for i in index..<candidates.count {
            if target < candidates[i] {
                return
            }
            cur.append(candidates[i])
            dfs(candidates, target - candidates[i], i, &cur, &ans)
            cur.removeLast()
        }
    }
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var cur: [Int] = []
        var ans: [[Int]] = []
        let candidates = candidates.sorted()
        dfs(candidates, target, 0, &cur, &ans)
        return ans
    }
    
    func test() {
        
        print(combinationSum([2,3,6,7], 7))
        print(combinationSum([2,3,5], 8))
        print(combinationSum([2], 1))
        
    }
}
