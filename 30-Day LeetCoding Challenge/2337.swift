//
//  2337.swift
//  Leetcode
//
//  Created by polaris dev on 2024/12/5.
//

import Foundation

class Solution2337 {
    func canChange(_ start: String, _ target: String) -> Bool {
        var i = 0, j = 0
                
        let start = Array(start), target = Array(target)

        while i <= start.count && j <= target.count {
            while j < target.count, target[j] == "_" {
                j = j + 1
            }
            
            while i < start.count, start[i] == "_" {
                i = i + 1
            }
            
            if j == target.count || i == start.count {
                return j == target.count && i == start.count
            }
            
            if target[j] != start[i] {
                return false
            } else if target[j] == "L", j > i {
                return false
            } else if target[j] == "R", j < i {
                return false
            } else {
                i = i + 1
                j = j + 1
            }
            
        }
        
        return true
    }
    
    func test() {
//        print(canChange("_L__R__R_", "L______RR"))
//        print(canChange("R_L_", "__LR"))
//        print(canChange("_R", "R_"))
//        print(canChange("_L__R__R_L", "L______RR_"))
//        print(canChange("__", "__"))
//        print(canChange("___L___", "_L_____"))
        print(canChange("_L", "LL"))
    }
    
}
