//
//  2385.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/10.
//

import Foundation

class Solution2385 {
    
    func dfs(_ root: TreeNode?, graph: inout [Int: [Int]]) {
        guard let root else { return }
        if let left = root.left {
            graph[left.val, default: []].append(root.val)
            graph[root.val, default: []].append(left.val)
            dfs(left, graph: &graph)
        }
        if let right = root.right {
            graph[right.val, default: []].append(root.val)
            graph[root.val, default: []].append(right.val)
            dfs(root.right, graph: &graph)
        }
    }
    
    func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
        var graph: [Int: [Int]] = [:]
        dfs(root, graph: &graph)
        
        var queue = [(start, 0)]
        var maxTime = 0
        var visited = Set<Int>()

        while !queue.isEmpty {
            let (node, time) = queue.removeFirst()
            if visited.contains(node) {
                continue
            }
            visited.insert(node)

            maxTime = max(maxTime, time)

            for neighbor in graph[node, default: []] {
                queue.append((neighbor, time + 1))
            }
        }
        return maxTime
    }
}
