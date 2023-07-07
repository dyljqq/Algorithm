//
//  2024.swift
//  Leetcode
//
//  Created by polaris dev on 2023/7/7.
//

import Foundation

class Solution2024 {
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        return max(
            getMax(character: Character("T"), answerKey: answerKey, k: k),
            getMax(character: Character("F"), answerKey: answerKey, k: k)
        )
    }
    
    func getMax(character: Character, answerKey: String, k: Int) -> Int {
        var left = 0, cnt = 0, ans = 0
        let answerKey = Array(answerKey)
        for (index, ch) in answerKey.enumerated() {
            if ch == character {
                cnt += 1
            }
            while cnt > k {
                if character == answerKey[left] {
                    cnt -= 1
                }
                left += 1
            }
            ans = max(ans, index - left + 1)
        }
        return ans
    }
    
    func test() {
        print(maxConsecutiveAnswers("TTFF", 2))
        print(maxConsecutiveAnswers("TFFT", 1))
        print(maxConsecutiveAnswers("TTFTTFTT", 1))
    }
}
