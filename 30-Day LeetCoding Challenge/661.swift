//
//  661.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/19.
//

import Foundation

class Solution661 {
    
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        var arr = Array(repeating: Array(repeating: 0, count: img[0].count), count: img.count)
        for i in 0..<img.count {
            for j in 0..<img[0].count {
                var total = 0
                var cnt = 0
                for x in max(0, i - 1)...min(i + 1, img.count - 1) {
                    for y in max(0, j - 1)...min(j + 1, img[0].count - 1) {
                        total += img[x][y]
                        cnt += 1
                    }
                }
                arr[i][j] = total / cnt
            }
        }
        return arr
    }
    
    func test() {
        print(imageSmoother([[1,1,1],[1,0,1],[1,1,1]]))
        print(imageSmoother([[100,200,100],[200,50,200],[100,200,100]]))
    }
}
