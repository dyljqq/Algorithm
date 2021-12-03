//
//  328.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/2.
//

import Foundation

/// 328. Odd Even Linked List
/// https://leetcode.com/problems/odd-even-linked-list/
class Leetcode328 {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var odd = head, even = head?.next, even_head = even
        while even != nil && even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }
        odd?.next = even_head
        return head
    }
}
