//
//  1750.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/5.
//

import Foundation

class Solution1750 {
    func minimumLength(_ s: String) -> Int {
        var p = 0, q = s.count - 1, s = Array(s)
        while p < q {
            guard s[p] == s[q] else { break }
            while p < q {
                guard s[p] == s[p + 1] else {
                    break
                }
                p = p + 1
            }
            while p < q {
                guard s[q] == s[q - 1] else { break }
                q = q - 1
            }
            p = p + 1
            q = q - 1
        }
        return q >= p ? (q - p + 1) : 0
    }
    
    func test() {
//        print(minimumLength("ca"))
//        print(minimumLength("cabaabac"))
//        print(minimumLength("aabccabba"))
        print(minimumLength("bbbbbbbbbbbbbbbbbbbbbbbbbbbabbbbbbbbbbbbbbbccbcbcbccbbabbb"))
    }
}
