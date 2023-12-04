//
//  2264.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/4.
//

import Foundation

class Leetcode2264 {
    
    func largestGoodInteger(_ num: String) -> String {
        guard num.count >= 3 else { return "" }
        let nums = Array(num)
        var v: Character?
        for index in 0..<(nums.count - 2) {
            if nums[index] == nums[index + 1] && nums[index] == nums[index + 2] {
                v = v == nil ? nums[index] : max(v!, nums[index])
            }
        }
        return v == nil ? "" : String(Array(repeating: v!, count: 3))
    }
    
    func test() {
        print(largestGoodInteger("6777133339"))
        print(largestGoodInteger("3200014888"))
        print(largestGoodInteger("2300019"))
    }
    
}
