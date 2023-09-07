//
//  92.swift
//  Leetcode
//
//  Created by polaris dev on 2023/9/7.
//

import Foundation

class ListNode {
    
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
}

class Solution92 {
    
    /**
     ListNode *reverseBetween(ListNode *head, int m, int n) {
             ListNode *dummy = new ListNode(-1), *pre = dummy;
             dummy->next = head;
             for (int i = 0; i < m - 1; ++i) pre = pre->next;
             ListNode *cur = pre->next;
             for (int i = m; i < n; ++i) {
                 ListNode *t = cur->next;
                 cur->next = t->next;
                 t->next = pre->next;
                 pre->next = t;
             }
             return dummy->next;
         }
     */
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let dummy: ListNode? = ListNode(-1)
        dummy?.next = head
        var pre = dummy
        
        for _ in 0..<(left - 1) {
            pre = pre?.next
        }
        
        let cur = pre?.next
        for _ in left..<right {
            let temp = cur?.next
            cur?.next = temp?.next
            temp?.next = pre?.next
            pre?.next = temp
        }
        return dummy?.next
    }
    
    func test() {
        var node = ListNode(1)
        node.next = ListNode(2)
        node.next?.next = ListNode(3)
        node.next?.next?.next = ListNode(4)
        node.next?.next?.next?.next = ListNode(5)
        
        var r = reverseBetween(node, 2, 4)
        while r != nil {
            print(r?.val)
            r = r?.next
        }
    }
}
