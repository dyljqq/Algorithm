//
//  857.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/11.
//

import Foundation

struct PriorityQueue<T> where T: Comparable {
    fileprivate var heap: [T] = []

    public var isEmpty: Bool {
        return heap.isEmpty
    }

    public var count: Int {
        return heap.count
    }
    
    public var peek: T? {
        return heap.first
    }

    @inline(__always) private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    @inline(__always) private func leftChildIndex(of index: Int) -> Int {
        return 2*index + 1
    }

    @inline(__always) private func rightChildIndex(of index: Int) -> Int {
        return 2*index + 2
    }

    public mutating func enqueue(_ element: T) {
        heap.append(element)
        siftUp(from: heap.count - 1)
    }

    public mutating func dequeue() -> T? {
        if heap.isEmpty {
            return nil
        } else if heap.count == 1 {
            return heap.removeFirst()
        } else {
            heap.swapAt(0, heap.count - 1)
            let element = heap.removeLast()
            siftDown(from: 0)
            return element
        }
    }

    private mutating func siftUp(from index: Int) {
        var childIndex = index
        let child = heap[childIndex]
        var parentIndex = self.parentIndex(of: childIndex)

        while childIndex > 0 && child < heap[parentIndex] {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }

        heap[childIndex] = child
    }

    private mutating func siftDown(from index: Int) {
        siftDown(from: index, to: heap.count)
    }

    private mutating func siftDown(from start: Int, to end: Int) {
        var start = start
        var leftChildIndex = self.leftChildIndex(of: start)

        while leftChildIndex < end {
            var first = start
            if heap[first] > heap[leftChildIndex] {
                first = leftChildIndex
            }
            if leftChildIndex + 1 < end && heap[first] > heap[leftChildIndex + 1] {
                first = leftChildIndex + 1
            }
            if first == start {
                return
            }
            heap.swapAt(start, first)
            start = first
            leftChildIndex = self.leftChildIndex(of: start)
        }
    }
}

class Solution857 {
    
    class Worker: Comparable {
        var quality: Double
        var wage: Double
        var ratio: Double

        init(_ quality: Int, _ wage: Int) {
            self.quality = Double(quality)
            self.wage = Double(wage)
            self.ratio = self.wage / self.quality
        }

        static func < (lhs: Worker, rhs: Worker) -> Bool {
            return lhs.quality > rhs.quality
        }

        static func == (lhs: Worker, rhs: Worker) -> Bool {
            return lhs.quality == rhs.quality
        }
    }
    
    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
        let workers = quality.indices.map { Worker(quality[$0], wage[$0]) }.sorted { $0.ratio < $1.ratio }
        var res = Double.greatestFiniteMagnitude
        var sumq = 0.0
        var queue = PriorityQueue<Worker>()

        for worker in workers {
            if let top = queue.peek, top.quality < worker.quality, queue.count >= k {
                continue
            }
            sumq += worker.quality
            if queue.count == k {
                sumq -= queue.dequeue()!.quality
            }
            if queue.count == k - 1 {
                res = min(res, sumq * worker.ratio)
            }
            queue.enqueue(worker)
        }

        return res
    }
    
    func test() {
        print(mincostToHireWorkers([10,20,5], [70,50,30], 2))
        print(mincostToHireWorkers([3,1,10,10,1], [4,8,2,2,7], 3))
    }
}

//There are n workers. You are given two integer arrays quality and wage where quality[i] is the quality of the ith worker and wage[i] is the minimum wage expectation for the ith worker.
//
//We want to hire exactly k workers to form a paid group. To hire a group of k workers, we must pay them according to the following rules:
//
//Every worker in the paid group must be paid at least their minimum wage expectation.
//In the group, each worker's pay must be directly proportional to their quality. This means if a worker’s quality is double that of another worker in the group, then they must be paid twice as much as the other worker.
//Given the integer k, return the least amount of money needed to form a paid group satisfying the above conditions. Answers within 10-5 of the actual answer will be accepted.
//
// 
//
//Example 1:
//
//Input: quality = [10,20,5], wage = [70,50,30], k = 2
//Output: 105.00000
//Explanation: We pay 70 to 0th worker and 35 to 2nd worker.
//Example 2:
//
//Input: quality = [3,1,10,10,1], wage = [4,8,2,2,7], k = 3
//Output: 30.66667
//Explanation: We pay 4 to 0th worker, 13.33333 to 2nd and 3rd workers separately.
