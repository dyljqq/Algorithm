//
//  2225.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/15.
//

import Foundation

class Solution2225 {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var hash: [Int: (Int, Int)] = [:]
        
        for match in matches {
            if let value = hash[match[0]] {
                hash[match[0]] = (value.0 + 1, value.1)
            } else {
                hash[match[0]] = (1, 0)
            }
            if let value = hash[match[1]] {
                hash[match[1]] = (value.0, value.1 - 1)
            } else {
                hash[match[1]] = (0, -1)
            }
        }
        
        var ans1: [Int] = [], ans2: [Int] = []
        for (key, value) in hash {
            if value.1 == 0 {
                ans1.append(key)
            } else if value.1 == -1 {
                ans2.append(key)
            }
        }
        
        return [ans1.sorted(), ans2.sorted()]
    }
    
    func test() {
        print(findWinners([[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]))
        print(findWinners([[2,3],[1,3],[5,4],[6,4]]))
    }
}
