//
//  380.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/16.
//

import Foundation

class RandomizedSet {
    
    private var set = Set<Int>()

    init() {
        set = Set<Int>()
    }
    
    func insert(_ val: Int) -> Bool {
        if set.contains(val) {
            return false
        }
        set.insert(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        if set.contains(val) {
            set.remove(val)
            return true
        }
        return false
    }
    
    func getRandom() -> Int {
        return set.randomElement() ?? -1
    }
}
