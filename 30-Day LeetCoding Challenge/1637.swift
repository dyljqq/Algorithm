//
//  1637.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/21.
//

import Foundation

class Solution1637 {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        let points = points.sorted { $0[0] < $1[0] }
        var ans = 0
        for (index, point) in points.enumerated() {
            if index != points.count - 1 {
                ans = max(ans, points[index + 1][0] - point[0])
            }
        }
        return ans
    }
    
    func test() {
        print(maxWidthOfVerticalArea([[8,7],[9,9],[7,4],[9,7]]))
        print(maxWidthOfVerticalArea([[3,1],[9,0],[1,0],[1,4],[5,3],[8,8]]))
    }
}
