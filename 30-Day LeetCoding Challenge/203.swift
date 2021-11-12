//
//  203.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/12.
//

import Foundation

class Leetcode203 {
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let root = ListNode(-1)
        root.next = head
        var prev = root
        
        while let current = prev.next {
            if current.val == val {
                prev.next = current.next
            } else {
                prev = current
            }
        }
        return root.next
    }
    
}
