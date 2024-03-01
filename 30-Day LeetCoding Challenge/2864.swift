//
//  2864.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/1.
//

import Foundation

class Solution2864 {
    func maximumOddBinaryNumber(_ s: String) -> String {
        var numOfOne = 0
        s.forEach { ch in
            numOfOne += ch == "1" ? 1 : 0
        }
        return (0..<(numOfOne - 1)).reduce("") { r, v in r + "1" } + (0..<(s.count - numOfOne)).reduce("") { r, v in r + "0" } + "1"
    }
    
    func test() {
        print(maximumOddBinaryNumber("010"))
        print(maximumOddBinaryNumber("0101"))
    }
}
