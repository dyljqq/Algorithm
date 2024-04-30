//
//  1915.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/30.
//

import Foundation

//class Solution:
//    def wonderfulSubstrings(self, word: str) -> int:
//        cnt = [0] * 1024
//        cnt[0] = 1  # 初始前缀和为 0，需将其计入出现次数
//        ans = s = 0
//        for c in word:
//            s ^= 1 << (ord(c) - ord('a'))  # 计算当前前缀和
//            ans += cnt[s]  # 所有字母均出现偶数次
//            ans += sum(cnt[s ^ (1 << i)] for i in range(10))  # 枚举其中一个字母出现奇数次，反转该字母的出现次数的奇偶性
//            cnt[s] += 1  # 更新前缀和出现次数
//        return ans

class Solution1915 {
    func wonderfulSubstrings(_ word: String) -> Int {
        var counter = Array(repeating: 0, count: 1024)
        counter[0] = 1
        var prefix = 0
        var res = 0
        
        for char in word.unicodeScalars {
            prefix ^= 1 << (char.value - Unicode.Scalar("a").value)
            res += counter[prefix]
            for i in 0..<10 {
                res += counter[prefix ^ (1<<i)]
            }
            counter[prefix] += 1
        }
        
        return res
    }
    
    func test() {
        print(wonderfulSubstrings("aba"))
    }
    
}
