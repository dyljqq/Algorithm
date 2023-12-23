//
//  1496.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/23.
//

import Foundation

class Solution1496 {
    func isPathCrossing(_ path: String) -> Bool {
        var set = Set<Int>()
        set.insert(0)
        var x = 0, y = 0
        for ch in path {
            if ch == "N" {
                y += 1
            } else if ch == "W" {
                x -= 1
            } else if ch == "E" {
                x += 1
            } else {
                y -= 1
            }
            let target = 20001 * x + y
            if set.contains(target) {
                return true
            }
            set.insert(target)
        }
        return false
    }
    
    func test() {
//        print(isPathCrossing("NES"))
        print(isPathCrossing("NESWW"))
    }
}
