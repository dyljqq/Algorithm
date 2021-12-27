//
//  476.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/27.
//

import Foundation

class Leetcode476 {
    func findComplement(_ num: Int) -> Int {
        var mask = ~0
        while (num & mask) > 0 {
            mask = mask << 1
        }
        return ~num ^ mask
    }
    
    func test() {
        print(findComplement(5))
        print(findComplement(1))
    }
}
