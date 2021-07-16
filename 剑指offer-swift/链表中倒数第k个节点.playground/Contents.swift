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

/**
 solution 1：
 遍历两次
 */
//class Solution {
//    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
//        var node = head, count = 0
//        while node != nil {
//            count += 1
//            node = node?.next
//        }
//
//        guard count >= k else {
//            return nil
//        }
//        var k = count - k
//        node = head
//        while k > 0 {
//            k = k - 1
//            node = node?.next
//        }
//
//        return head
//    }
//}

/**
 双指针
 */

class Solution {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var k = k, pre = head, lat = head
        while pre != nil {
            if k <= 0 {
                lat = lat?.next
            }
            pre = pre?.next
            k = k - 1
        }
        return lat
    }
}

let head = ListNode.construct(Array(1...6))
let solution = Solution()
print(solution.getKthFromEnd(head, 3))
