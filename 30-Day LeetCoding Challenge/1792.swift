//
//  1792.swift
//  Leetcode
//
//  Created by polaris dev on 2024/12/15.
//

class Solution1792 {
    
    class MaxHeap<T> {
        var heap: [T]
        let sort: (T, T) -> Bool
        
        init(sort: @escaping (T, T) -> Bool) {
            self.heap = []
            self.sort = sort
        }
        
        // 插入元素
        func insert(_ value: T) {
            heap.append(value)
            siftUp()
        }
        
        // 删除堆顶元素
        func pop() -> T? {
            guard !heap.isEmpty else { return nil }
            heap.swapAt(0, heap.count - 1)
            let value = heap.removeLast()
            siftDown()
            return value
        }
        
        // 获取堆顶元素
        func peek() -> T? {
            return heap.first
        }
        
        // 是否为空
        func isEmpty() -> Bool {
            return heap.isEmpty
        }
        
        // 上移操作，保持堆的性质
        private func siftUp() {
            var index = heap.count - 1
            while index > 0 {
                let parentIndex = (index - 1) / 2
                if sort(heap[index], heap[parentIndex]) {
                    heap.swapAt(index, parentIndex)
                    index = parentIndex
                } else {
                    break
                }
            }
        }
        
        // 下移操作，保持堆的性质
        private func siftDown() {
            var index = 0
            while 2 * index + 1 < heap.count {
                let leftChildIndex = 2 * index + 1
                let rightChildIndex = 2 * index + 2
                var candidateIndex = leftChildIndex
                if rightChildIndex < heap.count && sort(heap[rightChildIndex], heap[leftChildIndex]) {
                    candidateIndex = rightChildIndex
                }
                if sort(heap[candidateIndex], heap[index]) {
                    heap.swapAt(index, candidateIndex)
                    index = candidateIndex
                } else {
                    break
                }
            }
        }
    }
    
    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
        let k = extraStudents
        let heap = MaxHeap<(improvement: Double, pass: Int, total: Int)> { a, b in
            a.improvement > b.improvement  // 优先取 improvement 更大的课程
        }
        
        // 初始化堆
        for classData in classes {
            let pass = classData[0]
            let total = classData[1]
            let currentRatio = Double(pass) / Double(total)
            let improvement = (Double(pass + 1) / Double(total + 1)) - currentRatio
            heap.insert((improvement, pass, total))
        }
        
        // 执行最多 k 次操作
        for _ in 0..<k {
            // 获取堆顶（即改善最多的课程）
            if let top = heap.pop() {
                let (improvement, pass, total) = top
                let newPass = pass + 1
                let newTotal = total + 1
                let newImprovement = (Double(newPass + 1) / Double(newTotal + 1)) - (Double(newPass) / Double(newTotal))
                
                // 将修改后的课程重新插入堆
                heap.insert((newImprovement, newPass, newTotal))
            }
        }
        
        // 计算最终的平均通过率
        var totalRatio = 0.0
        var count = 0
        while let top = heap.pop() {
            let (_, pass, total) = top
            totalRatio += Double(pass) / Double(total)
            count += 1
        }
        
        return totalRatio / Double(count)
    }
    
    func test() {
        print(maxAverageRatio([[1,2],[3,5],[2,2]], 2))
        print(maxAverageRatio([[2,4],[3,9],[4,5],[2,10]], 4))
    }
}
