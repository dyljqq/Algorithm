//
//  1475.swift
//  Leetcode
//
//  Created by polaris dev on 2024/12/18.
//

import Foundation

class Solution1475 {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var stack: [Int] = []
        var result = prices

        for i in (0..<prices.count).reversed() {
            while !stack.isEmpty && prices[i] < prices[stack.last!] {
                stack.removeLast()
            }
            
            if !stack.isEmpty {
                result[i] -= prices[stack.last!]
            }

            stack.append(i)
        }
        
        return result
    }
    
    func test() {
        let prices = [8, 4, 6, 2, 3]
        let finalPrices = finalPrices(prices)
        print(finalPrices)
    }
    
}
