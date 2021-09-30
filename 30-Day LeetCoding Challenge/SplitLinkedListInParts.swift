//
//  SplitLinkedListInParts.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/9/30.
//

import Foundation

class SplitLinkedListInParts {
    
    func helper(_ head: ListNode?, _ avg: Int) -> (ListNode?, ListNode?) {
        guard avg > 0 else {
            return (nil, nil)
        }
        
        var next = head
        var count = 0
        while count < (avg - 1) {
            next = next?.next
            count += 1
        }
        let temp = next?.next
        next?.next = nil
        return (head, temp)
    }
    
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var total = 0
        var node = head
        while node != nil {
            node = node?.next
            total += 1
        }
        
        let avg = Int(total / k) + 1
        let n = total - k * (avg - 1)
        
        node =  head
        var rs: [ListNode?] = []
        for index in 0..<k {
            let v = index < n ? avg : avg - 1
            let value = helper(node, v)
            rs.append(value.0)
            node = value.1
        }
        
        return rs
    }
    
    func test() {
        
        let head: ListNode? = ListNode(1)
        var node = head
        for i in 2...10 {
            node?.next = ListNode(i)
            node = node?.next
        }
        let nodes = splitListToParts(head, 11)
        for node in nodes {
            var n = node
            var values = [Int]()
            while n != nil {
                values.append(n!.val)
                n = n?.next
            }
            print("[\(values.map{ String($0) }.joined(separator: ", "))]")
        }
    }
    
}
