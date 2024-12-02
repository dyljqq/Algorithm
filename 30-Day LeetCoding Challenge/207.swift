//
//  207.swift
//  Leetcode
//
//  Created by polaris dev on 2024/12/2.
//

import Foundation

class Solution207 {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var inDegreen: [Int] = Array(repeating: 0, count: numCourses)
        var graph: [[Int]] = Array(repeating: [Int](), count: numCourses)
        
        for prerequisite in prerequisites {
            let u = prerequisite[0]
            let v = prerequisite[1]
            
            graph[v].append(u)
            inDegreen[u] += 1
        }
        
        var queue: [Int] = []
        for i in 0..<numCourses {
            if inDegreen[i] == 0 {
                queue.append(i)
            }
        }
        
        var visited = 0
        while !queue.isEmpty {
            let value = queue.removeFirst()
            
            visited += 1
            for u in graph[value] {
                inDegreen[u] -= 1
                
                if inDegreen[u] == 0 {
                    queue.append(u)
                }
            }
        }
        
        return visited == numCourses
    }
}
