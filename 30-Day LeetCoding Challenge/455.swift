//
//  455.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/1.
//

import Foundation

class Solution455 {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let g = g.sorted()
        let s = s.sorted()
        
        var cnt = 0
        var j = 0
        for i in 0..<g.count {
            if j >= s.count {
                break
            }
            while j < s.count {
                if g[i] <= s[j] {
                    j = j + 1
                    cnt += 1
                    break
                }
                j = j + 1
            }
            
        }
        return cnt
    }
    
    func test() {
        print(findContentChildren([1,2,3], [1,1]))
        print(findContentChildren([1,2], [1,2,3]))
    }
}
