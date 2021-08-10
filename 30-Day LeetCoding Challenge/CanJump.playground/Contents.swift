import Cocoa

func canJump(_ nums: [Int]) -> Bool {
    var cnt = 0, reach = 0
    while cnt < nums.count && cnt <= reach {
        reach = max(cnt + nums[cnt], reach)
        cnt += 1
    }
    return cnt == nums.count
}

print(canJump([2,3,1,1,4]))
print(canJump([3,2,1,0,4]))
print(canJump([0]))
