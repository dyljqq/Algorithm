//
//  461.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/19.
//

import Foundation

class Leetcode461 {
    
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var z = x ^ y
        var count = 0
        while z > 0 {
            count += z & 1
            z = z >> 1
        }
        return count
    }
    
}
