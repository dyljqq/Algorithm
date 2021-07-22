import Cocoa

class Solution {
    
//    func getMinValue(_ nums: ArraySlice<Int>) -> (Int, Int) {
//        var minTuple = (0, Int.max)
//        for (i, num) in nums.enumerated() {
//            if num < minTuple.1 {
//                minTuple = (i, num)
//            }
//        }
//        return minTuple
//    }
//
//    func partitionDisjoint(_ nums: [Int]) -> Int {
//        guard !nums.isEmpty else {
//            return 0
//        }
//        var leftMaxValue = nums.first!
//        var right = getMinValue(nums.dropFirst())
//
//        if leftMaxValue < right.1 {
//            return 1
//        }
//
//        for i in 1..<nums.count {
//            let num = nums[i]
//            if leftMaxValue < num {
//                leftMaxValue = num
//            }
//
//            if num <= right.1 {
//                right = getMinValue(nums[(i + 1)..<nums.count])
//            }
//
//            if leftMaxValue <= right.1 {
//                return i + 1
//            }
//        }
//        return 0
//    }
    
    func partitionDisjoint(_ nums: [Int]) -> Int {
        var allMax = nums[0]
        var mx = nums[0]
        var res = 1
        
        for (i, num) in nums.dropFirst().enumerated() {
            if num < mx {
                res = i + 2
                mx = allMax
            } else {
                allMax = max(num, allMax)
            }
        }
        return res
    }
}

let solution = Solution()
print(solution.partitionDisjoint([1,1,1,0,6,12]))
print(solution.partitionDisjoint([5,0,3,8,6]))
print(solution.partitionDisjoint([1,1]))
