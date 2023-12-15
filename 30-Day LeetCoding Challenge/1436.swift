//
//  1436.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/15.
//

import Foundation

class Solution1436 {
    func destCity(_ paths: [[String]]) -> String {
        var dict: [String: String] = [:]
        paths.forEach { path in
            dict[path[0]] = path[1]
        }
        var set = Set<String>()
        for path in paths {
            set.insert(path[0])
            set.insert(path[1])
        }
        
        for key in set {
            if dict[key] == nil {
                return key
            }
        }
        return ""
    }
    
    func test() {
        print(destCity([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]))
        print(destCity([["B","C"],["D","B"],["C","A"]]))
    }
}
