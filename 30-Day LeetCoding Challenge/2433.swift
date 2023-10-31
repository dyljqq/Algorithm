//
//  2433.swift
//  Leetcode
//
//  Created by polaris dev on 2023/10/31.
//

import Foundation

// https://leetcode.com/problems/find-the-original-array-of-prefix-xor/description/?envType=daily-question&envId=2023-10-31
class Solution2433 {
    func findArray(_ pref: [Int]) -> [Int] {
        guard !pref.isEmpty else { return [] }
        var dp: [Int] = []
        dp.append(pref[0])

        for i in 1..<pref.count {
            dp.append(pref[i - 1] ^ pref[i])
        }
        return dp
    }
    
    func test() {
        print(findArray([5,2,0,3,1]))
    }
}
