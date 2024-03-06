//
//  141.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/6.
//

import Foundation

class Solution141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head, fast = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if fast == nil {
                return false
            } else if fast === slow {
                return true
            }
        }
        return false
    }
}
