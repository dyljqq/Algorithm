//
//  215.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/25.
//

import Foundation

/**
 用堆排序的性质构造一个k个元素的小顶堆，那么遍历完后，堆顶的元素就是我们要找的，第K大的元素
 */

class Leetcode215 {
  
  func ajustHeap(_ nums: [Int], _ val: Int) -> [Int] {
    var nums = nums
    nums.append(val)
    
    var n = nums.count - 1
    while n > 0 {
      let p = (n - 1) / 2
      if nums[p] > nums[n] {
        nums.swapAt(p, n)
      } else {
        return nums
      }
      n = p
    }
    return nums
  }
  
  func buildMaxHeap(_ nums: [Int]) -> [Int] {
    var heap: [Int] = []
    for num in nums {
      heap = ajustHeap(heap, num)
    }
    return heap
  }
  
  func help(_ heap: inout [Int], _ num: Int) {
    guard heap.first! < num else {
      return
    }
    heap.append(num)
    heap.swapAt(0, heap.count - 1)
    heap.removeLast()
    
    var p = 0
    while p < heap.count {
      let left = 2 * p + 1
      let right = 2 * p + 2
      if left < heap.count && right < heap.count {
        if heap[right] <= heap[left] && heap[p] > heap[right] {
          heap.swapAt(right, p)
          p = right
        } else if heap[left] <= heap[right] && heap[p] > heap[left] {
          heap.swapAt(left, p)
          p = left
        } else {
          return
        }
      } else if left < heap.count && heap[left] < heap[p] {
        heap.swapAt(left, p)
        p = left
      } else {
        return
      }
    }
  }
  
  func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    guard nums.count >= k else {
      return -1
    }
    
    var heap = buildMaxHeap(Array(nums[0..<k]))
    for num in nums[k..<nums.count] {
      help(&heap, num)
    }
    return heap.first ?? -1
  }
  
  func test() {
    print(findKthLargest([3,2,1,5,6,4], 2))
    print(findKthLargest([3,2,3,1,2,4,5,5,6], 4))
    print(findKthLargest([-1, 2, 0], 2))
  }
  
}
