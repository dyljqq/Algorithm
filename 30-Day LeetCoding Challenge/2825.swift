//
//  2825.swift
//  Leetcode
//
//  Created by polaris dev on 2024/12/4.
//

import Foundation

class Solution2825 {
    func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {
        let arr1 = Array(str1)
        let arr2 = Array(str2)
        
        var i = 0, j = 0
        while i < arr1.count && j < arr2.count {
            let a = arr1[i]
            let b = arr2[j]
            
            if a == b || (a.asciiValue! + 1) == b.asciiValue || (a == "z" && b == "a") {
                j += 1
            }
            
            i += 1
        }
        return j == str2.count
    }
    
    func test() {
        print(canMakeSubsequence("abc", "ad"))
        print(canMakeSubsequence("zc", "ad"))
        print(canMakeSubsequence("ab", "d"))
    }
}
