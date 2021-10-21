//
//  380.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/21.
//

import Foundation

class RandomizedSet {

    var set: Set<Int>
    
    init() {
        set = Set()
    }
    
    func insert(_ val: Int) -> Bool {
        guard !set.contains(val) else {
            return false
        }
        set.insert(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard set.contains(val) else {
            return false
        }
        set.remove(val)
        return true
    }
    
    func getRandom() -> Int {
        guard let val = set.randomElement() else {
            return -1
        }
        return val
    }
}
