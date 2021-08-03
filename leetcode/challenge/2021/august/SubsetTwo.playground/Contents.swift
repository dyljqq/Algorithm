import Cocoa

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    guard !nums.isEmpty else { return [] }
    let nums = nums.sorted()
    var res = [[Int]]()
    res.append([])

    var end = 0
    for index in 0..<nums.count {
        let start = index >= 1 && nums[index - 1] == nums[index] ? end : 0
        end = res.count
        
        for idx in start..<end {
            res.append(res[idx] + [nums[index]])
        }
    }
    return res
}

print(subsetsWithDup([1,2,2]))
print(subsetsWithDup([0]))
print(subsetsWithDup([4,4,4,1,4]))
