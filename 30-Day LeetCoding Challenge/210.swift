//
//  210.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/23.
//

import Foundation

class Leetcode210 {
    
    func dfs(_ cur: Int, _ graph: inout [[Int]], _ visited: inout [Int], _ ans: inout [Int]) -> Bool {
        if visited[cur] == 1 {
            return true
        } else if visited[cur] == 2 {
            return false
        }
        
        visited[cur] = 1
        for num in graph[cur] {
            if dfs(num, &graph, &visited, &ans) {
                return true
            }
        }
        
        visited[cur] = 2
        ans.append(cur)
        return false
    }
    
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph = Array(repeating: [Int](), count: numCourses)
        for prerequisite in prerequisites {
            graph[prerequisite[1]].append(prerequisite[0])
        }
        var visited: [Int] = Array(repeating: 0, count: numCourses)
        var ans: [Int] = []
        
        for i in 0..<numCourses {
            if dfs(i, &graph, &visited, &ans) {
                return []
            }
        }
        return ans.reversed()
    }
    
    func test() {
        print(findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))
    }
}
