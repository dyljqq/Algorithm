//
//  2542.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/11.
//

import Foundation

struct MinHeap<T: Comparable> {
    var heap: [T] = []
    
    var k: Int

    init(capacity: Int) {
        self.k = capacity
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    var count: Int {
        return heap.count
    }

    func peek() -> T? {
        return heap.first
    }

    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 1
    }

    func rightChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 2
    }

    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }

    mutating func remove() -> T? {
        guard !isEmpty else {
            return nil
        }
        heap.swapAt(0, count - 1)
        defer {
            siftDown(from: 0)
        }
        return heap.removeLast()
    }

    mutating func insert(_ element: T) {
        heap.append(element)
        siftUp(from: heap.count - 1)
    }

    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            if left < count && heap[left] < heap[candidate] {
                candidate = left
            }
            if right < count && heap[right] < heap[candidate] {
                candidate = right
            }
            if candidate == parent {
                return
            }
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }

    mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && heap[child] < heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
}

class Solution2542 {
    
    struct Value {
        let num: Int
        let mul: Int
    }
    
    func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        var heap = MinHeap<Int>(capacity: k)
        
        let nums = nums1.indices.map { Value(num: nums1[$0], mul: nums2[$0]) }.sorted { $0.mul > $1.mul }
        var sum = 0, res = 0
        for num in nums {
            sum += num.num
            if heap.count == k, let val = heap.remove() {
                sum -= val
            }
            if heap.count == k - 1 {
                res = max(res, sum * num.mul)
            }
            heap.insert(num.num)
        }
        return res
    }
    
    func test() {
        print(maxScore([1,3,3,2], [2,1,3,4], 3))
        print(maxScore([4,2,3,1,1], [7,5,10,9,6], 1))
    }
}

//You are given two 0-indexed integer arrays nums1 and nums2 of equal length n and a positive integer k. You must choose a subsequence of indices from nums1 of length k.
//
//For chosen indices i0, i1, ..., ik - 1, your score is defined as:
//
//The sum of the selected elements from nums1 multiplied with the minimum of the selected elements from nums2.
//It can defined simply as: (nums1[i0] + nums1[i1] +...+ nums1[ik - 1]) * min(nums2[i0] , nums2[i1], ... ,nums2[ik - 1]).
//Return the maximum possible score.
//
//A subsequence of indices of an array is a set that can be derived from the set {0, 1, ..., n-1} by deleting some or no elements.
//
// 
//
//Example 1:
//
//Input: nums1 = [1,3,3,2], nums2 = [2,1,3,4], k = 3
//Output: 12
//Explanation:
//The four possible subsequence scores are:
//- We choose the indices 0, 1, and 2 with score = (1+3+3) * min(2,1,3) = 7.
//- We choose the indices 0, 1, and 3 with score = (1+3+2) * min(2,1,4) = 6.
//- We choose the indices 0, 2, and 3 with score = (1+3+2) * min(2,3,4) = 12.
//- We choose the indices 1, 2, and 3 with score = (3+3+2) * min(1,3,4) = 8.
//Therefore, we return the max score, which is 12.
//Example 2:
//
//Input: nums1 = [4,2,3,1,1], nums2 = [7,5,10,9,6], k = 1
//Output: 30
//Explanation:
//Choosing index 2 is optimal: nums1[2] * nums2[2] = 3 * 10 = 30 is the maximum possible score.
// 
//
//Constraints:
//
//n == nums1.length == nums2.length
//1 <= n <= 105
//0 <= nums1[i], nums2[j] <= 105
//1 <= k <= n
