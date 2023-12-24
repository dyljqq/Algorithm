//
//  1758.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/24.
//

import Foundation

class Solution1758 {
    func minOperations(_ s: String) -> Int {
        var cnt = 0
        let s = Array(s)
        let hash = ["0": 0, "1": 1]
        for index in 0..<s.count {
            if hash[String(s[index])]! != (index % 2) {
                cnt += 1
            }
        }
        return min(cnt, s.count - cnt)
    }
    
    func test() {
        print(minOperations("0100"))
        print(minOperations("10"))
        print(minOperations("1111"))
        print(minOperations("10010100"))
    }
    
}
