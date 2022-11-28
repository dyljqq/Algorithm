//
//  2225.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/28.
//

import Foundation

class Leetcode2225 {
  func findWinners(_ matches: [[Int]]) -> [[Int]] {
    var winnerDict: [Int: Int] = [:], lostDict: [Int: Int] = [:]

    for match in matches {
      let winner = match[0]
      let lost = match[1]
      
      lostDict[lost, default: 0] += 1
      winnerDict[winner, default: 0] += 1
    }
    
    let winners: [Int] = winnerDict.filter { $0.value > 0 && lostDict[$0.key] == nil }.map { $0.key }
    let losts: [Int] = lostDict.filter { $0.value == 1 }.map { $0.key }
    return [winners.sorted(), losts.sorted()]
  }
  
  func test() {
    // [[1,2,10],[4,5,7,8]]
    print(findWinners([[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]))
  }
}
