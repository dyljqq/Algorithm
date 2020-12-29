//
//  FirstUniqueCharacterInAString.swift
//  Leetcode
//
//  Created by 季勤强 on 2020/12/29.
//

import Foundation

class FirstUniqueCharacterInAString {
    
    func firstUniqChar(_ s: String) -> Int {
        var d = Dictionary<Character, Int>()
        let arr = Array(s)
        for idx in 0..<s.count {
            let c = arr[idx]
            d[c] = (d[c] ?? 0) + 1
        }
        
        for idx in 0..<s.count {
            let c = arr[idx]
            let flag = d[c] ?? -1
            if flag == 1 {
                return idx
            }
        }
        return -1
    }
    
    func test() {
        print(firstUniqChar("leetcode"))
        print(firstUniqChar("loveleetcode"))
    }
}
