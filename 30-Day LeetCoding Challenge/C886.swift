//
//  C886.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/16.
//

import Foundation

class LeetcodeC886 {
  func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
    var graph = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    var colors = Array(repeating: 0, count: n + 1)
    
    for dislike in dislikes {
      graph[dislike[0]][dislike[1]] = 1
      graph[dislike[1]][dislike[0]] = 1
    }
    
    for i in 1..<(n + 1) {
      if colors[i] == 0 && !dfs(graph: graph, color: 1, cur: i, colors: &colors) {
        return false
      }
    }
    return true
  }
  
  func dfs(graph: [[Int]], color: Int, cur: Int, colors: inout [Int]) -> Bool {
    colors[cur] = color
    for i in 1..<graph.count {
      if graph[cur][i] == 1 {
        if color == colors[i] { return false }
        if colors[i] == 0 && !dfs(graph: graph, color: -color, cur: i, colors: &colors) { return false }
      }
    }
    return true
  }
  
  func test() {
    print(possibleBipartition(4, [[1,2],[1,3],[2,4]]))
    print(possibleBipartition(3, [[1,2],[1,3],[2,3]]))
    print(possibleBipartition(5, [[1,2],[2,3],[3,4],[4,5],[1,5]]))
  }
}
