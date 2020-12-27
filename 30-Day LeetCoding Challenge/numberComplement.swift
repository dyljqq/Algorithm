//
//  NumberComplement.swift
//  Leetcode
//
//  Created by 季勤强 on 2020/12/27.
//

import Foundation

class NumberComplement {
    
    func findComplement(_ num: Int) -> Int {
        var mask = Int.max
        while (mask & num) > 0 {
            mask <<= 1
        }
        return (~mask) & (~num)
    }
    
    func test() {
        print(findComplement(5))
    }
    
}
