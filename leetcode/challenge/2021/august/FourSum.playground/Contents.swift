import Cocoa

// 其实就是在ThreeSum上增加一层判断
func helper(index: Int, target: Int, nums: [Int], res: inout [[Int]]) {
    var left = index + 1, right = nums.count - 1
    while left < right {
        let t = nums[left] + nums[right]
        if t == target {
            res.append([nums[index], nums[left], nums[right]])
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

func threeSum(_ index: Int, _ nums: [Int], _ target: Int, _ res: inout [[Int]]) {
    for i in (index + 1)..<nums.count {
        if i > (index + 1) && nums[i] == nums[i - 1] { continue }
        let target = target - (nums[i] + nums[index])
        helper(index: i, target: target, nums: nums, res: &res)
    }
}

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard !nums.isEmpty else {
        return []
    }
    
    var results: [[Int]] = []
    let nums = nums.sorted()
    
    var res = [[Int]]()
    for i in 0..<nums.count {
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }
        let _ = threeSum(i, nums, target, &res)
        let r = res.map { [nums[i]] + $0 }
        results.append(contentsOf: r)
        
        res = []
    }
    return results
}

//print(fourSum([1,0,-1,0,-2,2], 0))
//print(fourSum([2,2,2,2,2], 8))
print(fourSum([-2,-1,-1,1,1,2,2], 0))
