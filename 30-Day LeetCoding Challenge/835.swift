//
//  835.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/27.
//

import Foundation

// https://leetcode.com/problems/image-overlap/
class Leetcode835 {
  struct Position {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
      self.x = x
      self.y = y
    }
  }
  
  func generatorPositions(_ img: [[Int]]) -> [Position] {
    var rs = [Position]()
    for row in 0..<img.count {
      for column in 0..<img[0].count {
        if img[row][column] == 1 {
          rs.append(Position(x: column, y: row))
        }
      }
    }
    return rs
  }
  
  func largestOverlap(_ img1: [[Int]], _ img2: [[Int]]) -> Int {
    var p1 = generatorPositions(img1)
    var p2 = generatorPositions(img2)
    
    var hash: [String: Int] = [:]
    for pa in p1 {
      for pb in p2 {
        let diff = "\(pa.y - pb.y)-\(pa.x - pb.x)"
        hash[diff, default: 0] += 1
      }
    }
    
    var mx = 0
    for value in hash.values {
      mx = max(mx, value)
    }
    return mx
  }
}
