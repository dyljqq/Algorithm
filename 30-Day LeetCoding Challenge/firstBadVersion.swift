//
//  firstBadVersion.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/6/28.
//

import Foundation

class FirstBadVersion {
    
    func isBadVersion(_ bad: Int) -> Bool {
        
        return true
    }
    
    func firstBadVersion(_ n: Int) -> Int {
        
        var first = 0
        var end = n
        
        while first < end {
            let mid = (first + end) / 2
            if isBadVersion(mid) {
                end = mid
            } else {
                first = mid + 1
            }
            
        }
        
        return first
        
    }
    
}
