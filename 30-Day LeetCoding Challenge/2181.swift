//
//  2181.swift
//  Leetcode
//
//  Created by polaris dev on 2024/7/4.
//

import Foundation

class Solution2181 {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var sum = 0
        var p = head, arr: [Int] = []
        while p != nil {
            if p?.val == 0 {
                arr.append(sum)
                sum = 0
            } else {
                sum += p?.val ?? 0
            }
            p = p?.next
        }
        
        var root = ListNode(-1)
        p = root
        for ele in arr.dropFirst() {
            p?.next = ListNode(ele)
            p = p?.next
        }
        return root.next
    }
    
    func test() {
        let node = [0,3,1,0,4,5,2,0].toListNode()
        mergeNodes(node)
        
        mergeNodes([0,1,0,3,0,2,2,0].toListNode())
    }
}
