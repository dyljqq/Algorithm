//
//  231.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/21.
//

import Foundation

class Leetcode231 {
    
    func isPowerOfTwo(_ n: Int) -> Bool {
        return (n > 0) && (n & (n - 1)) == 0
    }
    
    func test() {
        for num in [1, 16, 3, -4, -5] {
            print(isPowerOfTwo(num))
        }
    }
}
