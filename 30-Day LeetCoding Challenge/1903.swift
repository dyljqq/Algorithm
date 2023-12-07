//
//  1903.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/7.
//

import Foundation

class Solution1903 {
    func largestOddNumber(_ num: String) -> String {
        let num = Array(num)
        for (index, ch) in num.reversed().enumerated() {
            if let value = Int(String(ch)), value % 2 == 1 {
                return String(num[0..<(num.count - index)])
            }
        }
        return ""
    }
    
    func test() {
        print(largestOddNumber("52"))
        print(largestOddNumber("4206"))
        print(largestOddNumber("35427"))
    }
}
