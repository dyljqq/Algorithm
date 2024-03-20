//
//  1669.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/20.
//

import Foundation

class Solution1669 {
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var p = list1
        var start1: ListNode? = nil, end1: ListNode? = nil, end2: ListNode? = nil
        var count = 0
        while p != nil {
            if count == a - 1 {
                start1 = p
            } else if count == b + 1 {
                end1 = p
            }
            
            count += 1
            p = p?.next
        }
        p = list2
        while p?.next != nil {
            p = p?.next
        }
        
        end2 = p
        
        start1?.next = list2
        end2?.next = end1
        
        p = end1
        
        return list1
    }
    
    func test() {
        // list1 = [10,1,13,6,9,5], a = 3, b = 4, list2 = [1000000,1000001,1000002]
        let root = mergeInBetween([10,1,13,6,9,5].toListNode(), 3, 4, [1000000,1000001,1000002].toListNode())
        var p = root
        while p != nil {
            print(p!.val)
            p = p?.next
        }
    }
    
}

extension Array where Element == Int {
    
    func toListNode() -> ListNode? {
        var root = ListNode(-1)
        var p: ListNode? = root
        for ele in self {
            p?.next = ListNode(ele)
            p = p?.next
        }
        return root.next
    }
    
}
