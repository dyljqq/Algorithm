import Cocoa

func findMin(_ nums: [Int]) -> Int {
    var left = 0, right = nums.count - 1
    while left < right {
        let mid = (left + right) / 2
        if nums[mid] < nums[right] {
            right = mid
        } else {
            left = mid + 1
        }
    }
    return nums[right]
}

print(findMin([3,4,5,1,2]))
