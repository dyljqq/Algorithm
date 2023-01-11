//
//  1443.swift
//  Leetcode
//
//  Created by polaris dev on 2023/1/11.
//

import Foundation

class Leetcode1443 {
    
    var graph: [Int: [Int]] = [:]
    
    func dfs(_ node: Int, _ apples: [Bool]) -> (Int, Bool) {
        var tmp = 0
        for n in graph[node, default: []] {
            let (v, hasApple) = dfs(n, apples)
            tmp += v + (hasApple ? 2 : 0)
        }
        return (tmp, tmp > 0 || apples[node])
    }
    
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        graph = [:]
        edges.forEach {
            graph[$0[0], default: []] += [$0[1]]
        }
        return dfs(0, hasApple).0
    }
    
    func test() {
        print(minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], [false,false,true,false,true,true,false]))
        print(minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], [false,false,true,false,false,true,false]))
        print(minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], [false,false,false,false,false,false,false]))
    }
}
