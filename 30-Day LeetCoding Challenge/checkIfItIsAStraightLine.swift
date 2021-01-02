//
//  CheckIfItIsAStraightLine.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/1/2.
//

import Foundation

class CheckIfItIsAStraightLine {
    
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        guard coordinates.count >= 2 else {
            return true
        }
        
        let divident = Double(coordinates[0][1] - coordinates[1][1])
        let divisor = Double(coordinates[0][0] - coordinates[1][0])
        let k: Double = divisor != 0 ? divident / divisor : 0
        let b: Double = Double(coordinates[0][1]) - k * Double(coordinates[0][0])
        
        for i in 2..<coordinates.count {
            if divisor == 0 {
                if coordinates[i][0] != coordinates[0][0] {
                    return false
                }
            } else if divident == 0 {
                if coordinates[i][1] != coordinates[0][1] {
                    return false
                }
            } else {
                let value = k * Double(coordinates[i][0]) + b
                if value != Double(coordinates[i][1]) {
                    return false
                }
            }
        }
        
        return true
    }
    
    func test() {
        
        print(checkStraightLine([[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]))
        print(checkStraightLine([[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]))
        print(checkStraightLine([[0,0],[0,1],[0,-1]]))
        print(checkStraightLine([[2,4],[2,5],[2,8]]))
        
    }
}
