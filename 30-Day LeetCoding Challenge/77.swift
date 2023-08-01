//
//  77.swift
//  Leetcode
//
//  Created by polaris dev on 2023/8/1.
//

import Foundation

class Solution77 {
    
    var res: [[Int]] = []
    
    func dfs(n: Int, begin: Int, k: Int, path: inout [Int]) {
        guard (n - k + path.count + 1) >= begin, path.count != k else {
            if path.count == k {
                res.append(path)
            }
            return
        }
        for j in begin...(n - k + path.count + 1) {
            path.append(j)
            dfs(n: n, begin: j + 1, k: k, path: &path)
            path.removeLast()
        }
    }
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        res = []
        var path: [Int] = []
        dfs(n: n, begin: 1, k: k, path: &path)
        return res
    }
    
    func test() {
        print(combine(4, 2))
        print(combine(1, 1))
    }
    
}
