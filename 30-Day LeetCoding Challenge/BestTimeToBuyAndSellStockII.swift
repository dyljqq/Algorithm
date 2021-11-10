//
//  BestTimeToBuyAndSellStockII.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/10.
//

import Foundation

class BestTimeToBuyAndSellStockII {
    
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else {
            return 0
        }
        var profit = 0
        for day in 1..<prices.count {
            let diff = prices[day] - prices[day - 1]
            if diff > 0 {
                profit += diff
            }
        }
        return profit
    }
    
}
