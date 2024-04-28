//
//  834.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/28.
//

import Foundation

class Solution834 {
    
    func dfs(_ node: Int, _ parent: Int, _ graph: inout [[Int]], _ count: inout [Int], _ ans: inout [Int]) {
        for child in graph[node] where child != parent {
            dfs(child, node, &graph, &count, &ans)
            count[node] += count[child]
            // ans[child]表示子节点到她的各个子节点的距离总和，但是node到这些所有子节点的距离总和都少了1，所以用count[child]补上
            ans[node] += ans[child] + count[child]
        }
    }
    
    func dfs2(_ node: Int, _ parent: Int, _ graph: inout [[Int]], _ count: inout [Int], _ ans: inout [Int], _ N: Int) {
        for child in graph[node] where child != parent {
            ans[child] = ans[node] - count[child] + N - count[child]
            dfs2(child, node, &graph, &count, &ans, N)
        }
    }
    
    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph = [[Int]](repeating: [], count: n)
        var count = [Int](repeating: 1, count: n)
        var ans = [Int](repeating: 0, count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        dfs(0, -1, &graph, &count, &ans)
        dfs2(0, -1, &graph, &count, &ans, n)
        return ans
    }
}
