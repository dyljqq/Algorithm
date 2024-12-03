//
//  2109.swift
//  Leetcode
//
//  Created by polaris dev on 2024/12/3.
//

import Foundation

class Solution2109 {
    func addSpaces(_ s: String, _ spaces: [Int]) -> String {
        var results: [Character] = []
        
        var j = 0
        for (index, ch) in s.enumerated() {
            let i = index + 1
            if j < spaces.count, spaces[j] < i {
                j = j + 1
                results.append(" ")
            }
            results.append(ch)
        }
        
        return String(results)
    }
    
    func test() {
        print(addSpaces("LeetcodeHelpsMeLearn", [8,13,15]))
        print(addSpaces("icodeinpython", [1,5,7,9]))
        print(addSpaces("spacing", [0,1,2,3,4,5,6]))
    }
}
