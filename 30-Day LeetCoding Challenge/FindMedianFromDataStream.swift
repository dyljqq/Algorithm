//
//  FindMedianFromDataStream.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/12.
//

import Foundation

class MedianFinder {
    
    struct Heap {
        
        let isMaxHeap: Bool
        
        var nums: [Int] = []
        
        var defaultValue: Int {
            return isMaxHeap ? Int.min : Int.max
        }
        
        var peek: Int {
            if nums.isEmpty {
                return isMaxHeap ? Int.min : Int.max
            }
            return nums.first ?? 0
        }
        
        var length: Int {
            return nums.count
        }
        
        var isEmpty: Bool {
            return nums.isEmpty
        }
        
        init(isMaxHeap: Bool = false) {
            self.isMaxHeap = isMaxHeap
        }
        
        mutating func insert(_ num: Int) {
            nums.append(num)
            
            var childIndex = nums.count - 1
            while childIndex > 0 {
                let parentIndex = (childIndex - 1) / 2
                if (isMaxHeap && nums[parentIndex] < nums[childIndex])
                    || (!isMaxHeap && nums[parentIndex] > nums[childIndex]) {
                    nums.swapAt(parentIndex, childIndex)
                    childIndex = parentIndex
                } else {
                    break
                }
            }
        }
        
        mutating func ajust(_ num: Int) {
            nums.append(num)
            nums.swapAt(0, nums.count - 1)
            nums.removeLast()
            
            var parentIndex = 0
            let n = nums.count
            
            while parentIndex < n {
                var postionIndex = parentIndex
                
                if (parentIndex * 2 + 1) < n && comparator(childValue: nums[parentIndex * 2 + 1], parentValue: nums[parentIndex])  {
                    postionIndex = parentIndex * 2 + 1
                }
                
                if (parentIndex * 2 + 2) < n && comparator(childValue: nums[parentIndex * 2 + 2], parentValue: nums[postionIndex]) {
                    postionIndex = parentIndex * 2 + 2
                }
                
                if postionIndex == parentIndex {
                    break
                }
                
                nums.swapAt(postionIndex, parentIndex)
                parentIndex = postionIndex
            }
        }
        
        func comparator(childValue: Int, parentValue: Int) -> Bool {
            if isMaxHeap {
                return parentValue < childValue
            } else {
                return parentValue > childValue
            }
        }
        
        mutating func swap(_ i: Int, _ j: Int) {
            let temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp
        }
        
        func childValue(_ index: Int) -> Int {
            guard index < nums.count else {
                return defaultValue
            }
            return nums[index]
        }
        
        @discardableResult
        func checkValid() -> Bool {
            guard !isEmpty else {
                return true
            }
            print("\(isMaxHeap ? "最大堆" : "最小堆"): ")
            for index in 1..<self.length {
                var childIndex = index
                while childIndex > 0 {
                    let parentIndex = (childIndex - 1) / 2
                    if isMaxHeap && nums[parentIndex] < nums[childIndex] {
                        print("parentIndex: \(parentIndex), childIndex: \(childIndex), value: \(nums[parentIndex]), childValue: \(nums[childIndex])")
                        return false
                    } else if !isMaxHeap && nums[parentIndex] > nums[childIndex] {
                        print("parentIndex: \(parentIndex), childIndex: \(childIndex), value: \(nums[parentIndex]), childValue: \(nums[childIndex])")
                        return false
                    }
                    childIndex = parentIndex
                }
            }
            print("valid heap...")
            return true
        }
        
    }
        
    var maxHeap = Heap(isMaxHeap: true)
    var minHeap = Heap(isMaxHeap: false)
    
    init() {
        
    }
    
    func addNum(_ num: Int) {
        if minHeap.length == maxHeap.length {
            var top = num
            if minHeap.peek < num {
                top = minHeap.peek
                minHeap.ajust(num)
            }
            maxHeap.insert(top)
        } else {
            var top = num
            if maxHeap.peek > num {
                top = maxHeap.peek
                maxHeap.ajust(num)
            }
            minHeap.insert(top)
        }
    }
    
    func findMedian() -> Double {
        if minHeap.length == maxHeap.length {
            return (Double(minHeap.peek) + Double(maxHeap.peek)) / 2
        } else {
            if minHeap.isEmpty {
                return Double(maxHeap.peek)
            } else if maxHeap.isEmpty {
                return Double(minHeap.peek)
            }
            return minHeap.peek < maxHeap.peek ? Double(minHeap.peek) : Double(maxHeap.peek)
        }
    }
    
    func test() {
//        let finder = MedianFinder()
//        finder.addNum(1)
//        finder.addNum(100)
//        finder.addNum(10)
//        finder.addNum(19)
//        finder.addNum(101)
//        finder.addNum(-100)
//        finder.addNum(29)
//        print(finder.findMedian())
        let funcNames = ["MedianFinder","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian"]


        let values = [[],[78],[],[14],[],[50],[],[20],[],[13],[],[9],[],[25],[],[8],[],[13],[],[37],[],[29],[],[33],[],[55],[],[52],[],[6],[],[17],[],[65],[],[23],[],[74],[],[43],[],[5],[],[29],[],[29],[],[72],[],[7],[],[13],[],[56],[],[21],[],[31],[],[66],[],[69],[],[69],[],[74],[],[12],[],[77],[],[23],[],[10],[],[6],[],[27],[],[63],[],[77],[],[21],[],[40],[],[10],[],[19],[],[59],[],[35],[],[40],[],[44],[],[4],[],[15],[],[29],[],[63],[],[27],[],[46],[],[56],[],[0],[],[60],[],[72],[],[35],[],[54],[],[50],[],[14],[],[29],[],[62],[],[24],[],[18],[],[79],[],[16],[],[19],[],[8],[],[77],[],[10],[],[21],[],[66],[],[42],[],[76],[],[14],[],[58],[],[20],[],[0],[]]

        for i in 0..<funcNames.count {
            let name = funcNames[i]
            if name == "addNum" {
                addNum(values[i][0])
            } else if name == "findMedian" {
                let value = findMedian()
//                print(value)
            }
        }
        
        minHeap.checkValid()
        maxHeap.checkValid()
    }
}
