//
//  1290.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/7.
//

import Foundation

/// 1290. Convert Binary Number in a Linked List to Integer
class Leetcode1290 {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var node = head
        var nums = [Int]()
        while node != nil {
             nums.append(node!.val)
            node = node?.next
        }
        
        var sum = 0, mux = 1
        for num in nums.reversed() {
            sum += num * mux
            mux *= 2
        }
        return sum
    }
}
