//
//  81.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/2/12.
//

import Foundation

/**
 81. Search in Rotated Sorted Array II
 https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
 
 这题比较难的点其实在于数组中存在相同的值，因此需要做一个额外的判断。
 如果nums[mid] > nums[left]，那么我们就能知道left～mid是单调递增的，因此我们可以通过判定target是否在这个区间来缩小查找区间。
 如果nums[mid] < nums[left],那么mid~right这个区间是非递增的单调区间，同理去判定target是否在这个区间。
 那么如果nums[left] == nums[mid]呢，这个时候就存在两种情况，左右都可能是单调递增区间的，比如[1,3,3,3,3,3, 4]，我们既可以变成[3,4,1,3,3,3,3],也可以是[3,3,4,1,3,3,3]，这个时候我们只知道left是不符合题意的，因此left增加一位。
 */

class Leetcode81 {
    
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                return true
            }
            if nums[mid] > nums[left] {
                if nums[mid] > target && target >= nums[left] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else if nums[mid] < nums[left] {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                left += 1
            }
        }
        return false
    }
    
    func test() {
        print(search([2,5,6,0,0,1,2], 0))
        print(search([2,5,6,0,0,1,2], 3))
        print(search([1,0,1,1,1], 0))
    }
    
}
