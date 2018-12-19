//
//  QueueReconstructionByHeight.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/12/19.
//  Copyright © 2018 dyljqq. All rights reserved.
//

import Foundation

class QueueReconstructionByHeight {
  func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    people.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] > $1[0]  }.forEach { result.insert($0, at: $0[1]) }
    return result
  }
  
  func test() {
//    print(reconstructQueue([[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]))
    print(reconstructQueue([[8,2],[4,2],[4,5],[2,0],[7,2],[1,4],[9,1],[3,1],[9,0],[1,0]]))
  }
}
