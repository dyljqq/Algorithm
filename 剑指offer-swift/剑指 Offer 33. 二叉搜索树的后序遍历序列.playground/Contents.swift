import Cocoa

class Solution {
    
    func helper(_ begin: Int, _ end: Int, _ postorder: [Int]) -> Bool {
        if begin >= end {
            return true
        }
        let target = postorder.last!
        var p = begin
        while postorder[p] < target {
            p += 1
        }
        let mid = p
        while postorder[p] >= target {
            p += 1
        }
        return p == end && helper(begin, mid - 1, postorder) && helper(mid, end, postorder)
    }
    
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        guard !postorder.isEmpty else {
            return false
        }
        return helper(0, postorder.count - 1, postorder)
    }
}

let solution = Solution()
print(solution.verifyPostorder([1,6,3,2,5]))
print(solution.verifyPostorder([1,3,2,6,5]))
