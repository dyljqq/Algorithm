//
//  876.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/7.
//

import Foundation

class Solution876 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
