//
//  791.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/11.
//

import Foundation

class Solution791 {
    func customSortString(_ order: String, _ s: String) -> String {
        
        func helper(_ v: Int, ch: String) -> String {
            (0..<v).reduce("") { r, _ in r + ch }
        }
        
        var hash: [String: Int] = [:]
        s.forEach { hash[String($0), default: 0] += 1 }
        
        var res: String = ""
        for ch in order {
            if let v = hash[String(ch)] {
                res += (0..<v).reduce("") { r, index in r + String(ch) }
                hash[String(ch)] = 0
            }
        }
        
        return res + hash.filter { $0.1 > 0 }.reduce("") { $0 + helper($1.value, ch: $1.key) }
    }
    
    func test() {
        print(customSortString("kqep", "pekeq"))
        let r = customSortString("hucw", "utzoampdgkalexslxoqfkdjoczajxtuhqyxvlfatmptqdsochtdzgypsfkgqwbgqbcamdqnqztaqhqanirikahtmalzqjjxtqfnh")
        print(r.count == "hhhhhuucccwaaaaaaaaabbdddddeffffggggiijjjjkkkkllllmmmmnnnoooopppqqqqqqqqqqqrsssttttttttvxxxxxyyzzzzz".count)
    }
}
