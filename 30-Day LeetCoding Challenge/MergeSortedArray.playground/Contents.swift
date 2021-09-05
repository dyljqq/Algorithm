import Cocoa

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var p = m - 1, q = n - 1
    for index in stride(from: m + n - 1, through: 0, by: -1) {
        if p >= 0 && q >= 0 {
            if nums1[p] > nums2[q] {
                nums1[index] = nums1[p]
                p -= 1
            } else {
                nums1[index] = nums2[q]
                q -= 1
            }
        } else if p >= 0 {
            nums1[index] = nums1[p]
            p -= 1
        } else {
            nums1[index] = nums2[q]
            q -= 1
        }
    }
    print(nums1)
}

var a = [1,2,3,0,0,0]
merge(&a, 3, [2, 5, 6], 3)

a = [1]
merge(&a, 1, [], 0)

a = [0]
merge(&a, 0, [1], 1)

a = [2, 0]
merge(&a, 1, [1], 1)

a = [4, 5, 6, 0, 0, 0]
merge(&a, 3, [1, 2, 3], 3)
