//
//  IsomorphicStrings.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/13.
//

import Foundation

class IsomorphicStrings {
    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        
        guard s.count == t.count else {
            return false
        }
        
        var hash: [String.Element: String.Element] = [:]
        
        let sa = Array(s), ta = Array(t)
        for i in 0..<s.count {
            if let value = hash[sa[i]] {
                if value != ta[i] {
                    return false
                } else {
                    continue
                }
            }
            
            if !hash.values.contains(ta[i]) {
                hash[sa[i]] = ta[i]
            } else {
                return false
            }
            
        }
        return true
    }
    
    func test() {
        
//        print(isIsomorphic("egg", "add"))
//        print(isIsomorphic("foo", "bar"))
//        print(isIsomorphic("paper", "title"))
        print(isIsomorphic("badc", "baba"))
        
    }
    
}
