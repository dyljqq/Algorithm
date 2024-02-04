//
//  76.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/4.
//

import Foundation

class Solution76 {
    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count >= t.count else { return "" }
        var dictT = [Character: Int]()
        var dictS = [Character: Int]()
        for char in t {
            dictT[char, default: 0] += 1
        }

        var formed = 0
        var left = 0
        var right = 0
        let required = dictT.count

        var ans = (Int.max, 0, 0) // window length, left pointer, right pointer
        
        let sArr: [Character] = Array(s)

        while right < sArr.count {
            let char = sArr[right]
            dictS[char, default: 0] += 1
        
            if dictT.keys.contains(char) && dictS[char]! == dictT[char]! {
                formed += 1
            }
        
            while left <= right && formed == required {
                if ans.0 > right - left + 1 {
                    ans = (right - left + 1, left, right)
                }
            
                let lChar = sArr[left]
                dictS[lChar]! -= 1
                if dictT.keys.contains(lChar) && dictS[lChar]! < dictT[lChar]! {
                    formed -= 1
                }
            
                left += 1
            }
        
            right += 1
        }
        
        return ans.0 == Int.max ? "" : String(Array(sArr[ans.1...ans.2]))
    }
}
