import UIKit

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class ReverseLinkedList {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil, next = head
        while next != nil {
            let temp = next?.next
            next?.next = pre
            pre = next
            next = temp
        }
        return pre
    }
    
}
