//
//  3243.swift
//  Leetcode
//
//  Created by polaris dev on 2024/11/27.
//

import Foundation

class Solution3243 {
    
    func bfs(_ n: Int, _ graph: [[Int]]) -> Int {
        var dist = Array(repeating: Int.max - 1, count: n)
        var queue = [0]
        dist[0] = 0
        
        var index = 0
        while index < queue.count {
            let currentCity = queue[index]
            index += 1
            
            for neighbor in graph[currentCity] {
                if dist[currentCity] + 1 < dist[neighbor] {
                    dist[neighbor] = dist[currentCity] + 1
                    queue.append(neighbor)
                }
            }
        }
        
        return dist[n - 1]
    }
    
    func shortestDistanceAfterQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var graph = Array(repeating: [Int](), count: n)
        var result = [Int]()
        
        (0..<n - 1).forEach { graph[$0] = [$0 + 1] }
        
        for query in queries {
            let u = query[0]
            let v = query[1]
            
            graph[u].append(v)
            
            let shortestDist = bfs(n, graph)
            result.append(shortestDist)
        }
        
        return result
    }
    
    func test() {
        print(shortestDistanceAfterQueries(5, [[2,4],[0,2],[0,4]]))
        print(shortestDistanceAfterQueries(4, [[0,3],[0,2]]))
        print(shortestDistanceAfterQueries(5, [[2,4],[1,4]]))
        print(shortestDistanceAfterQueries(14, [[1,7],[6,9],[6,13]])) // [8,8,7]
    }
}
