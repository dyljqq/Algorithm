import Cocoa

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }
        
        var hash: [Int: Int] = [:]
        for (index, num) in nums.enumerated() {
            if let idx = hash[target - num] {
                return [idx, index]
            }
            hash[num] = index
        }
        
        return []
    }
}

let solution = Solution()
print(solution.twoSum([2,7,11,15], 9))
print(solution.twoSum([3,2,4], 6))
print(solution.twoSum([3, 3], 6))
