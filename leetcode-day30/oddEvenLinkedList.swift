//
//  oddEvenLinkedList.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/2/8.
//

import Foundation

class OddEvenLinkedList {
    
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var p = head
        let op = p
        var lastP = op
        let np: ListNode? = ListNode(0)
        var newp = np
        
        while p != nil  {
            newp?.next = p?.next
            p?.next = newp?.next?.next
            lastP = p
            p = p?.next
            newp = newp?.next
        }
        lastP?.next = np?.next
        return op
    }
    
    func test() {
        let np = self.oddEvenList(ListNode.construct([2, 1, 3, 5, 6, 4, 7]))
        np?.tranverse()
        
    }
    
}
