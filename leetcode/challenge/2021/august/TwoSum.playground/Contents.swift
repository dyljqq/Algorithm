import Cocoa

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard !nums.isEmpty else {
        return []
    }
    
    var hash: [Int: Int] = [:]
    nums.enumerated().forEach { hash[$1] = $0 }
    
    for (index, num) in nums.enumerated() {
        if let idx = hash[target - num] {
            return [index, idx]
        }
    }
    return []
}

print(twoSum([2,7,11,15], 9))
print(twoSum([3,2,4], 6))
print(twoSum([3,3], 6))
