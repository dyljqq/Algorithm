//
//  143.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/22.
//

import Foundation

class Leetcode143 {
    func reorderList(_ head: ListNode?) {
        var arr: [Int] = []
        var node = head
        while node != nil {
            arr.append(node!.val)
            node = node?.next
        }
        
        let pn = ListNode(-1)
        node = pn
        var p = 0, q = arr.count - 1
        while p < q {
            node?.next = ListNode(arr[p])
            node = node?.next
            node?.next = ListNode(arr[q])
            node = node?.next
            p += 1
            q -= 1
        }
        
        if (p == q) {
            node?.next = ListNode(arr[p])
        }
        
        node = pn.next
        var h = head
        while node != nil {
            h!.val = node!.val
            h = h?.next
            node = node?.next
        }
        
        node = head
        while node != nil {
            print(node?.val)
            node = node?.next
        }
    }
    
    func test() {
        let root: ListNode? = ListNode(-1)
        var node = root
        for num in [1, 2, 3, 4, 5] {
            node!.next = ListNode(num)
            node = node?.next
        }
        reorderList(root?.next)
    }
}
