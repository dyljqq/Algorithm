import UIKit

class IntersectionOfTwoArray {
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count < nums2.count {
            return intersect(nums2, nums1)
        }
        var hash: [Int: Int] = [:]
        nums2.forEach { hash[$0] = (hash[$0] ?? 0) + 1 }

        var rs = [Int]()
        for num in nums1 {
            if let value = hash[num], value > 0 {
                hash[num] = value - 1
                rs.append(num)
            }
        }
        return rs
    }
    
    func test() {
        print(intersect([1,2,2,1], [2, 2]))
        print(intersect([9,4,9,8,4], [4, 9, 5, 4]))
    }
}
