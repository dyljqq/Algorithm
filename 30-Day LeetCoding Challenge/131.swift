//
//  131.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/22.
//

import Foundation

class Solution131 {
    func partition(_ s: String) -> [[String]] {
        var s = Array(s), path = [String](), res = [[String]]()
        dfs(s, res: &res, path: &path, start: 0)
        return res
    }
    
    func dfs(_ s: [Character], res: inout [[String]], path: inout [String], start: Int) {
        guard start < s.count else {
            res.append(path)
            return
        }
        
        for end in start..<s.count {
            if isPalindrome(s, start: start, end: end) {
                path.append(String(s[start...end]))
                dfs(s, res: &res, path: &path, start: end + 1)
                path.removeLast()
            }
        }
    }
    
    func isPalindrome(_ s: [Character], start: Int, end: Int) -> Bool {
        var start = start, end = end
        while start <= (end + 1) / 2 {
            if s[start] != s[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
    
    func test() {
        print(partition("aab"))
        print(partition("a"))
    }
    
}
