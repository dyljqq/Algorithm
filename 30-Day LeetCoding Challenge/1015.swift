//
//  1015.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/30.
//

import Foundation

class Leetcode1015 {
    /// 1015. Smallest Integer Divisible by K
    /// 一些数学特性
    /// 1. 一个数能被2或者5整除，那么一定不能由全是1组成的数字
    /// 2. 反之，一定存在一个长度小余k的数字能够整除k
    /// 设g(n) = f(n) % k 那么f(n) = f(n - 1) * 10 + 1, g(n) = g(n - 1) * 10 + 1
    /// 这个是因为数字可能会溢出，因此需要降维
    func smallestRepunitDivByK(_ k: Int) -> Int {
        guard k % 2 != 0 && k % 5 != 0 else {
            return -1
        }
        
        var r = 0, count = 0
        while count <= k {
            r = (r * 10 + 1) % k
            count += 1
            if r == 0 {
                return count
            }
        }
        return -1
    }
}
