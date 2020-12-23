//
//  jewelsAndStones.swift
//  Leetcode
//
//  Created by 季勤强 on 2020/12/23.
//

import Foundation


class JewelsAndStones {
    
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var d = Dictionary<Character, Int>()
        stones.forEach { c in
            d[c] = d[c] != nil ? d[c]! + 1 : 1
        }
        return jewels.reduce(0) { $0 + (d[$1] ?? 0) }
    }
    
    func test() {
        print(numJewelsInStones("aA", "aAAbbbb"))
    }
    
}
