//
//  2125.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/3.
//

import Foundation

class Solution2125 {
    
    func numOfOne(_ str: String) -> Int {
        return str.reduce(0) { $0 + ($1 == "1" ? 1 : 0) }
    }
    
    func numberOfBeams(_ bank: [String]) -> Int {
        let rows: [Int] = bank.compactMap { numOfOne($0) }
        var last: Int? = nil
        var total = 0
        for row in rows {
            if let last {
                total += last * row
            }
            last = row > 0 ? row : last
        }
        return total
    }
    
    func test() {
        print(numberOfBeams(["011001","000000","010100","001000"]))
        print(numberOfBeams(["000","111","000"]))
    }
}
