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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil || l2 != nil else {
            return l1 ?? l2
        }
        var l1 = l1, l2 = l2, l3: ListNode? = ListNode(-1)
        while l1 != nil || l2 != nil {
            guard l1 == nil || l2 == nil else {
                l3?.next = l1 ?? l2
                break
            }
            if l1!.val < l2!.val {
                l3?.next = l1
                l1 = l1?.next
            } else {
                l3?.next = l2
                l2 = l2?.next
            }
            l3 = l3?.next
        }
        return l3?.next
    }
}

let solution = Solution()
let l1 = ListNode.construct([1,2,4])
let l2 = ListNode.construct([1,3,4])
let l3 = solution.mergeTwoLists(l1, l2)
l3?.tranverse()
