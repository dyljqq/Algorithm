//
//  234.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/22.
//

import Foundation

class Solution234 {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil, next: ListNode? = nil, node = head
            
        while node != nil {
          next = node?.next
          node?.next = prev
          prev = node
          node = next
        }
        
        return prev
    }
    
    func linkListToArray(_ node: ListNode?) -> [Int] {
        var arr: [Int] = []
        var p = node
        while p != nil {
            arr.append(p!.val)
            p = p?.next
        }
        return arr
    }
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        let first = linkListToArray(head)
        let other = reverseList(head)
        return first == linkListToArray(other)
    }
    
    func test() {
        let root = [1, 1, 2, 1].toListNode()
        print(isPalindrome(root))
        print(isPalindrome([1, 2, 2, 1].toListNode()))
    }

}
