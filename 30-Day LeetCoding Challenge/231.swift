//
//  231.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/19.
//

import Foundation

class Solution231 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        (n > 0) && (n & (n - 1)) == 0
    }
}
