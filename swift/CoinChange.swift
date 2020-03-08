//
//  CoinChange.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/8.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class CoinChange {
  func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp: [Int] = Array(repeating: amount + 1, count: amount + 1)
    dp[0] = 0
    for i in 0...amount {
      for coin in coins {
        if i < coin {
          continue
        }
        dp[i] = min(dp[i], 1 + dp[i - coin])
      }
    }
    return dp[amount] == amount + 1 ? -1 : dp[amount]
  }
  
  func test() {
    print(coinChange([2], 3))
    print(coinChange([1, 2, 5], 11))
  }
}
