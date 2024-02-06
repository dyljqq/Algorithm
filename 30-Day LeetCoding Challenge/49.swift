//
//  49.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/6.
//

import Foundation

class Solution49 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hash: [String: [String]] = [:]
        strs.forEach { str in
            let key = String(str.sorted())
            hash[key, default: []].append(str)
        }
        return hash.values.map { $0 }
    }
    
    func test() {
        print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
        print(groupAnagrams([]))
        print(groupAnagrams(["a"]))
    }
}
