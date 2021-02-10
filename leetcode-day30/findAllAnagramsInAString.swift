//
//  findAllAnagramsInAString.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/2/9.
//

import Foundation

class FindAllAnagramsInAString {
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let sl = s.count
        let pl = p.count
        
        let nv = Int(Character("a").asciiValue!)
        
        var pa = Array(repeating: 0, count: 26)
        
        for c in p.unicodeScalars {
            let v = Int(c.value)
            let index = v - nv
            pa[index] += 1
        }
        
        let arr = Array(s)
        var sa = Array(repeating: 0, count: 26)
        var res: [Int] = []
        for i in 0..<sl {
            if (i >= pl) {
                let ec = Character(String(arr[i - pl]))
                let index = Int(ec.asciiValue!) - nv
                sa[index] -= 1
            }
            sa[Int(Character(String(arr[i])).asciiValue!) - nv] += 1
            
            if sa == pa {
                res.append(i - pl + 1)
            }
        }
        
        return res
    }
    
    func test() {
        print(findAnagrams("cbaebabacd", "abc"))
        print(findAnagrams("abab", "ab"))
    }
    
}
