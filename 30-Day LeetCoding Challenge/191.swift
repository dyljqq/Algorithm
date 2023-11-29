//
//  191.swift
//  Leetcode
//
//  Created by polaris dev on 2023/11/29.
//

import Foundation

class Leetcode191 {
    func hammingWeight(_ n: Int) -> Int {
        var n = n, cnt = 0
        while n != 0 {
            if n & 1 == 1 {
                cnt += 1
            }
            n = n >> 1
        }
        return cnt
    }
}
