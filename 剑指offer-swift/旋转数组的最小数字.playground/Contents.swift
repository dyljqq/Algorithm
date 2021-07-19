import Cocoa

class Solution {
    func minArray(_ numbers: [Int]) -> Int {
        guard !numbers.isEmpty else {
            return 0
        }
        
        var left = 0, right = numbers.count - 1
        while left < right {
            let mid = (left + right) / 2
            if numbers[mid] > numbers[right] {
                left = mid + 1
            } else if numbers[mid] < numbers[right] {
                right = mid
            } else {
                right = right - 1
            }
        }
        return numbers[left]
    }
}

let solution = Solution()
print(solution.minArray([3,4,5,1,2]))
