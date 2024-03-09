//
//  2540.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/9.
//

import Foundation

class Solution2540 {
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var i = 0, j = 0
        while i < nums1.count, j < nums2.count {
            if nums1[i] == nums2[j] {
                return nums1[i]
            } else if nums1[i] < nums2[j] {
                i += 1
            } else {
                j += 1
            }
        }
        return -1
    }
}
