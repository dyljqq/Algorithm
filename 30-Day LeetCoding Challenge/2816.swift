//
//  2816.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/7.
//

import Foundation

//You are given the head of a non-empty linked list representing a non-negative integer without leading zeroes.
//
//Return the head of the linked list after doubling it.

class Solution2816 {
    
    func reverse(_ head: ListNode?) -> ListNode? {
        var p = head, q: ListNode? = nil
        while p != nil {
            let temp = p?.next
            p?.next = q
            q = p
            p = temp
        }
        return q
    }
    
    func doubleIt(_ head: ListNode?) -> ListNode? {
        let q = reverse(head)
        var p = q, remain = 0, slow = q
        while p != nil {
            let val = p!.val * 2
            p?.val = val % 10 + remain
            remain = val / 10
            if p?.next == nil {
                slow = p
            }
            p = p?.next
        }
        if remain > 0 {
            slow?.next = ListNode(remain)
        }
        return reverse(q)
    }
    
    func test() {
        // [1,8,9]
        // The figure above corresponds to the given linked list which represents the number 189. Hence, the returned linked list represents the number 189 * 2 = 378.
        
        let head = [1, 8, 9].toListNode()
        let node = doubleIt(head)
        node?.tranverse()
        
        doubleIt([9, 9, 9].toListNode())?.tranverse()
    }
}
