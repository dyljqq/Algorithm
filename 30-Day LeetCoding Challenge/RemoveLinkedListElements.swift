//
//  File.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/9.
//

import Foundation

class RemoveLinkedListElements {
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let newHead = ListNode(-1)
        newHead.next = head
        var prev = newHead
        while let current = prev.next {
            if current.val == val {
                prev.next = current.next
            } else {
                prev = current
            }
        }
        return newHead.next
    }
    
    func test() {
        let nums = [1,2,6,3,4,5,6]
        let head: ListNode? = ListNode(1)
        var node = head
        for num in nums.dropFirst() {
            node?.next = ListNode(num)
            node = node?.next
        }
        let _ = removeElements(head, 6)
    }
    
}
