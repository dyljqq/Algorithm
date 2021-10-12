//
//  GuessNumberHigherOrLower.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/12.
//

import Foundation

class GuessNumberHigherOrLower {
    
//    You call a pre-defined API int guess(int num), which returns 3 possible results:
//
//    -1: The number I picked is lower than your guess (i.e. pick < num).
//    1: The number I picked is higher than your guess (i.e. pick > num).
//    0: The number I picked is equal to your guess (i.e. pick == num).
    func guessNumber(_ n: Int) -> Int {
        var left = 1, right = n
        while left <= right {
            let mid = (left + right) / 2
            if guess(mid) == -1 {
                right = mid - 1
            } else if guess(mid) == 1 {
                left = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
    
    func guess(_ num: Int) -> Int {
        let pick = 2
        if pick < num {
            return -1
        } else if pick > num {
            return 1
        } else {
            return 0
        }
    }
    
    func test() {
        print(guessNumber(2))
    }
    
}
