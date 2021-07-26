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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0
        var l1 = l1, l2 = l2
        let head: ListNode? = ListNode(-1)
        var h = head
        while l1 != nil || l2 != nil {
            var sum = 0
            if l1 != nil {
                sum += l1!.val
                l1 = l1?.next
            }
            
            if l2 != nil {
                sum += l2!.val
                l2 = l2?.next
            }
            
            sum += carry
            h?.next = ListNode(sum % 10)
            h = h?.next
            carry = sum / 10
        }
        
        if carry > 0 {
            h?.next = ListNode(carry)
        }
        
        return head?.next
    }
}

let solution = Solution()

let l1 = ListNode.construct([9,9,9,9,9,9,9])
let l2 = ListNode.construct([9,9,9,9])
let l3 = solution.addTwoNumbers(l1, l2)
l3?.tranverse()
