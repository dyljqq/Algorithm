import Cocoa

class Solution {
    
    func getMinValue(_ nums: ArraySlice<Int>) -> (Int, Int) {
        var minTuple = (0, Int.max)
        for (i, num) in nums.enumerated() {
            if num < minTuple.1 {
                minTuple = (i, num)
            }
        }
        return minTuple
    }
    
    func partitionDisjoint(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var leftMaxValue = nums.first!
        var right = getMinValue(nums.dropFirst())
        
        if leftMaxValue < right.1 {
            return 1
        }
        
        for i in 1..<nums.count {
            let num = nums[i]
            if leftMaxValue < num {
                leftMaxValue = num
            }
            
            if num <= right.1 {
                right = getMinValue(nums[(i + 1)..<nums.count])
            }
            
            if leftMaxValue <= right.1 {
                return i + 1
            }
        }
        return 0
    }
}

let solution = Solution()
print(solution.getMinValue([1,1,1,0,6,12]))
print(solution)
