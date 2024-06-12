//
//  75.swift
//  Leetcode
//
//  Created by polaris dev on 2024/6/12.
//

import Foundation

class Solution75 {
    
    func quickSort<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
        if low < high {
            let pivotIndex = partition(&array, low: low, high: high)
            quickSort(&array, low: low, high: pivotIndex - 1)
            quickSort(&array, low: pivotIndex + 1, high: high)
        }
    }

    func partition<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
        let pivot = array[high]
        var i = low
        for j in low..<high {
            if array[j] <= pivot {
                array.swapAt(i, j)
                i += 1
            }
        }
        array.swapAt(i, high)
        return i
    }
    
    func sortColors(_ nums: inout [Int]) {
        quickSort(&nums, low: 0, high: nums.count - 1)
    }
}
