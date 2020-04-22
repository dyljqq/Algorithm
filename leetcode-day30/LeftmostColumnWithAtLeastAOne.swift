//
//  LeftmostColumnWithAtLeastAOne.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/22.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LeftmostColumnWithAtLeastAOne {
  
  public class BinaryMatrix {
    
    let matrix: [[Int]]
    
    init(_ matrix: [[Int]]) {
      self.matrix = matrix
    }
    
    public func get(_ x: Int, _ y: Int) -> Int {
      guard !matrix.isEmpty && x >= 0 && x < matrix.count && y >= 0 && y < matrix[0].count else {
        return -1
      }
      return matrix[x][y]
    }

    public func dimensions() -> [Int] {
      guard !matrix.isEmpty else {
        return [0, 0]
      }
      return [matrix.count, matrix[0].count]
    }

  }
  
  func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
    let dimensions = binaryMatrix.dimensions()
    let n = dimensions[0]
    let m = dimensions[1]
    var row = 0
    var column = m - 1
    var leftMost = -1
    
    while column >= 0 && row < n {
      if binaryMatrix.get(row, column) == 1{
        leftMost = column
        column -= 1
      } else {
        row += 1
      }
    }
    return leftMost
  }
  
  func test() {
    func printResult(_ matrix: [[Int]]) {
      let binaryMatrix = BinaryMatrix(matrix)
      print(leftMostColumnWithOne(binaryMatrix))
    }
    
    printResult([[0,0],[1,1]])
    printResult([[0,0],[0,1]])
    printResult([[0,0],[0,0]])
    printResult([[0,0,0,1],[0,0,1,1],[0,1,1,1]])
  }
  
}
