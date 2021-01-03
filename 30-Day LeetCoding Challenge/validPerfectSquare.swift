//
//  ValidPerfectSquare.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/1/3.
//

import Foundation

class ValidPerfectSquare {
    func isPerfectSquare(_ num: Int) -> Bool {
        var cnt = 1
        var num = num
        while num > 0 {
           num -= cnt
            cnt += 2
        }
        return num == 0
    }
    
    func test() {
        print(isPerfectSquare(16))
        print(isPerfectSquare(14))
    }
}
