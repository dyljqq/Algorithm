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
    func reversePrint(_ head: ListNode?) -> [Int] {
        var fast = head, arr = [Int]()
        while fast != nil {
            arr.append(fast!.val)
            fast = fast?.next
        }
        return arr.reversed()
    }
}
