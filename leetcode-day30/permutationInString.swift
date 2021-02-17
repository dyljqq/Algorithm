//
//  permutationInString.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/2/17.
//

import Foundation

class PermutationInString {
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        guard s1.count <= s2.count else {
            return false
        }
        
        var d1: [String.Element: Int] = [:]
        for c in s1 {
            d1[c] = (d1[c] ?? 0) + 1
        }
        
        let l1 = s1.count
        let arr = Array(s2)
        var d2: [String.Element: Int] = [:]
        for i in 0..<s2.count {
            
            let ch = arr[i]
            d2[ch] = (d2[ch] ?? 0) + 1
            
            if i >= l1 {
                let c = arr[i - l1]
                
                if d2[c] == 1 {
                    d2.removeValue(forKey: c)
                } else {
                    d2[c] = d2[c]! - 1
                }
            }
            
            
            if d2 == d1 {
                return true
            }
            
        }
        
        return false
    }
    
    func test() {
        
        print(checkInclusion("ab", "eidboaoo"))
        print(checkInclusion("ab", "eidbaooo"))
        
    }
    
}
