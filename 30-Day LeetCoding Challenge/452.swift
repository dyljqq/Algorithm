//
//  452.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/18.
//

import Foundation

class Solution452 {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard !points.isEmpty else { return 0 }
        let points = points.sorted { $0[1] < $1[1] }
        var cur = points[0]
        var res = 1
        for point in points.dropFirst() {
            if point[0] > cur[1] {
                cur = point
                res += 1
            }
        }
        return res
    }
    
    func test() {
        print(findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]))
        print(findMinArrowShots([[1,2],[3,4],[5,6],[7,8]]))
        print(findMinArrowShots([[1,2],[2,3],[3,4],[4,5]]))
    }
}
