//
//  802.swift
//  Leetcode
//
//  Created by polaris dev on 2023/7/12.
//

import Foundation

class Solution802 {
    
    var color: [Int] = []
    
    func safeNode(index: Int, graph: [[Int]]) -> Bool {
        if color[index] > 0 { return color[index] == 2 }
        color[index] = 1
        for num in graph[index] {
            if !safeNode(index: num, graph: graph) {
                return false
            }
        }
        color[index] = 2
        return true
    }
    
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        color = Array(repeating: 0, count: graph.count)        
        return (0..<graph.count).filter { safeNode(index: $0, graph: graph) }
    }
    
    func test() {
        print(eventualSafeNodes([[1,2],[2,3],[5],[0],[5],[],[]]))
        print(eventualSafeNodes([[1,2,3,4],[1,2],[3,4],[0,4],[]]))
    }
}
