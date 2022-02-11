//
//  567.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/2/11.
//

import Foundation

/**
 567. Permutation in String
 https://leetcode.com/problems/permutation-in-string/
 
 题目的意思是说s2中是否包含s1的全排列字符串。我们可以通过哈希跟滑动窗口去做。然后比较s2中长度为s1的窗口的哈希表是否与s1相等。每次滑动的时候，左边的去除，加入右边的，使得长度保持在s1长度的窗口长度，直到遍历完整个s2字符串。
 */

class Leetcode567 {
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s1.count <= s2.count else {
            return false
        }
        
        var hash: [String.Element: Int] = [:]
        for ch in s1 {
            hash[ch, default: 0] += 1
        }
        
        let l1 = s1.count
        let arr = Array(s2)
        var d: [String.Element: Int] = [:]
        for (i, ch) in s2.enumerated() {
            if i < l1 {
                d[ch, default: 0] += 1
            } else {
                d[ch, default: 0] += 1
                let c = arr[i - l1]
                if let v = d[c], v == 1 {
                    d.removeValue(forKey: c)
                } else {
                    d[c, default: 0] -= 1
                }
            }
            
            if d == hash {
                return true
            }
        }
        return false
    }
    
    func test() {
        print(checkInclusion("ab", "eidbaooo"))
    }
    
}
