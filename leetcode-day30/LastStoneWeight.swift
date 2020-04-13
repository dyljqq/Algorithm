//
//  LastStoneWeight.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/13.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LastStoneWeight {
  
  func swap(_ i: Int, _ j: Int, _ heap: inout [Int]) {
    let temp = heap[i]
    heap[i] = heap[j]
    heap[j] = temp
  }
  
  func recreateHeap(_ stone: Int, _ heap: inout [Int]) {
    heap.append(stone)
    if heap.count == 1 {
      return
    }
    var count = heap.count - 1
    while count > 0 {
      let parent = (count - 1) / 2
      if heap[count] > heap[parent] {
        swap(count, parent, &heap)
        count = parent
      } else {
        return
      }
    }
  }
  
  func generateHeap(_ stones: [Int]) -> [Int] {
    var heap: [Int] = []
    for stone in stones {
      recreateHeap(stone, &heap)
    }
    return heap
  }
  
  func preUpload(_ heap: inout [Int]) {
    var count = 0
    while (2 * count + 1) < heap.count {
      let left = 2 * count + 1
      let right = 2 * count + 2
      if right < heap.count && heap[right] > heap[left] && heap[right] > heap[count] {
        swap(right, count, &heap)
        count = right
      } else if heap[left] > heap[count] {
        swap(left, count, &heap)
        count = left
      } else {
        return
      }
    }
  }
  
  func getRootValue(_ heap: inout [Int]) -> Int {
    swap(0, heap.count - 1, &heap)
    let root = heap.removeLast()
    preUpload(&heap)
    return root
  }
  
  func helper(_ heap: inout [Int]) {
    let first = getRootValue(&heap)
    let second = getRootValue(&heap)
    
    if first == second {
      return
    }
    recreateHeap(first - second, &heap)
  }
  
  func lastStoneWeight(_ stones: [Int]) -> Int {
    guard !stones.isEmpty else {
      return 0
    }
    var heap = generateHeap(stones)
    while heap.count > 1 {
      helper(&heap)
    }
    return heap.first ?? 0
  }
  
  func test() {
    print(lastStoneWeight([2,7,4,1,8,1]))
    print(lastStoneWeight([10,4,2,10]))
    print(lastStoneWeight([10,10,7,2]))
    print(lastStoneWeight([1,2,1,1,1,1,1]))
    print(lastStoneWeight([316,157,73,106,771,828,46,212,926,604,600,992,71,51,477,869,425,405,859,924,45,187,283,590,303,66,508,982,464,398]))
  }
  
}
