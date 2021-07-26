import Cocoa

class ListNode {
    
    var val: Int
    
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
    }
    
    class func construct(_ arr: [Int]) -> ListNode? {
        guard !arr.isEmpty else {
            return nil
        }
        let p: ListNode = ListNode(arr[0])
        var np = p
        for val in arr.dropFirst() {
            np.next = ListNode(val)
            np = np.next!
        }
        
        return p
    }
    
    func tranverse() {
        var p: ListNode? = self
        while p != nil {
            print(p!.val)
            p = p?.next
        }
    }
    
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head, fast = head?.next
        
        while fast != nil {
            if fast === slow {
                return true
            }
            
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return false
    }
}

let solution = Solution()
let head = ListNode.construct([-1])
//
//var h = head
//while h?.next != nil {
//    h = h?.next
//}
//
//h?.next = head?.next

print(solution.hasCycle(head))
