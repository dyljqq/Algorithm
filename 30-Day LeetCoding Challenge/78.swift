//
//  78.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/21.
//

import Foundation

class Solution78 {
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        nums.reduce([[]]) { (result, num) in
            return result + result.map { $0 + [num] }
        }
    }
    
    func test() {
        print(subsets([1,2,3]))
        print(subsets([0]))
    }
}
