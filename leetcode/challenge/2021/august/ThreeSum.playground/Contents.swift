import Cocoa

var res: [[Int]] = []
func helper(index: Int, target: Int, nums: [Int]) {
    var left = index + 1, right = nums.count - 1
    while left < right {
        let t = nums[left] + nums[right]
        if t == target {
            res.append([nums[left], nums[right], nums[index]])
            left += 1
            while left < right && nums[left] == nums[left - 1] {
                left += 1
            }
            
            while left < right && nums[right] == nums[right - 1] {
                right -= 1
            }
        } else if t > target {
            right -= 1
        } else {
            left += 1
        }
    }
}

func threeSum(_ nums: [Int]) -> [[Int]] {
    guard !nums.isEmpty else {
        return []
    }
    let nums = nums.sorted()
    for i in 0..<nums.count {
        if i > 0 && nums[i] == nums[i - 1] { continue }
        let target = -nums[i]
        helper(index: i, target: target, nums: nums)
    }
    return res
}

print(threeSum([-1,0,1,2,-1,-4]))
