//
//  876.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/28.
//

import Foundation

class Leetcode876 {
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var first = head, second = head
        while second != nil && second?.next != nil {
            first = first?.next
            second = second?.next?.next
        }
        return first
    }
    
    func test() {
        var head = ListNode(1)
        head.next = ListNode(2)
        print(middleNode(head))
    }
    
}
