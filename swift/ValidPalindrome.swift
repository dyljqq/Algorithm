//
//  ValidPalindrome.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/9/23.
//

import Foundation

class ValidPalindrome {
    
    func isAlphaNumeric(_ c: Character) -> Bool {
        return c.isNumber || (Character("a") <= c && Character("z") >= c)
    }
    
    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else {
            return false
        }
        
        let arr = Array(s.lowercased())
        var left = 0, right = arr.count - 1
        while left < right {
            let leftC = arr[left]
            let rightC = arr[right]
            if !isAlphaNumeric(leftC) {
                left += 1
                continue
            }
            if !isAlphaNumeric(rightC) {
                right -= 1
                continue
            }
            if leftC != rightC {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
    func test() {
        print(isPalindrome("A man, a plan, a canal: Panama"))
        print(isPalindrome("race a car"))
    }
    
}
