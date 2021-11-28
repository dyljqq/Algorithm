//
//  797.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/28.
//

import Foundation

class Leetcode797 {
    
    func dfs(_ graph: [[Int]], _ path: inout [Int], _ ans: inout [[Int]]) {
        guard let last = path.last, last != graph.count - 1 else {
            ans.append(path)
            return
        }
        
        for num in graph[last] {
            path.append(num)
            dfs(graph, &path, &ans)
            path.removeLast()
        }
    }

    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var ans: [[Int]] = []
        var path: [Int] = [0]
        dfs(graph, &path, &ans)
        return ans
     }
}
