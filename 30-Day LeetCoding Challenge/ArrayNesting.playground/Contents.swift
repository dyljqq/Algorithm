import UIKit

func arrayNesting(_ nums: [Int]) -> Int {
    var nums = nums
    var mx = Int.min
    for num in nums {
        var count = 0
        var index = num
        while nums[index] != -1 {
            let temp = nums[index]
            nums[index] = -1
            index = temp
            count += 1
        }
        mx = max(mx, count)
    }
    return mx
}

print(arrayNesting([5,4,0,3,1,6,2]))
print(arrayNesting([0,1,2]))
