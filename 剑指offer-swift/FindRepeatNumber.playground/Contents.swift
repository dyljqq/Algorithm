import Cocoa

class Solution {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        
        var hash: [Int: Int] = [:]
        for num in nums {
            hash[num] = (hash[num] ?? 0) + 1
            if hash[num] == 2 {
                return num
            }
        }
        return 0
    }
}
