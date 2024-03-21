//
//  206.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/21.
//

import Foundation

class Solution206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var p = head, q: ListNode? = nil
        while p != nil {
            let temp = p?.next
            p?.next = q
            q = p
            p = temp
        }
        return q
    }
}
