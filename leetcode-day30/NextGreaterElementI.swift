//
//  NextGreaterElementI.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/19.
//

import Foundation

class NextGreaterElementI {
    
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var hash: [Int: Int] = [:]
        nums2.enumerated().forEach { (index, num) in
            hash[num, default: -1] = index
        }
        
        var rs: [Int] = []
        for num in nums1 {
            if let index = hash[num] {
                var flag = false
                for idx in index..<nums2.count {
                    if nums2[idx] > num {
                        flag = true
                        rs.append(nums2[idx])
                        break
                    }
                }
                if !flag {
                    rs.append(-1)
                }
            }
        }
        return rs
    }
    
}
