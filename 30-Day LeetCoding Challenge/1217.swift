//
//  1217.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/6.
//

import Foundation

/// 1217. Minimum Cost to Move Chips to The Same Position
/// https://leetcode.com/problems/minimum-cost-to-move-chips-to-the-same-position/
///
/// 这题的题目比较绕，其实就是奇数位置的筹码在奇数上移动没有损耗，偶数位同理。因此统计奇偶的数目，取其中的较小值
class Leetcode1217 {
    func minCostToMoveChips(_ position: [Int]) -> Int {
        var odd = 0, even = 0
        for p in position {
            if (p % 2 == 0) {
                even += 1
            } else {
                odd += 1
            }
        }
        return min(even, odd)
    }
}
