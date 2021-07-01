//
//  kClosestPointsToOrigin.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/6/29.
//

import Foundation

class KClosestPointsToOrigin {
    
    struct Result {
        
        var res: Int = Int.min
        var point: [Int] = []
        
        init() {
            
        }
        
        init(res: Int, point: [Int]) {
            self.res = res
            self.point = point
        }
        
    }

    func calDistance(_ point: [Int]) -> Int {
        return point[0] * point[0] + point[1] * point[1]
    }
    
    func swap(_ p: Int, _ q: Int, _ results: inout [Result]) {
        let temp = results[p]
        results[p] = results[q]
        results[q] = temp
    }
    
    func buildHeap(_ points: [[Int]]) -> [Result] {
        
        var results = [Result]()
        for point in points {
            let r = calDistance(point)
            results.append(Result(res: r, point: point))
            
            var n = results.count
            while n > 1 {
                let pre = n / 2 - 1
                if results[pre].res < results[n - 1].res {
                    swap(pre, n - 1, &results)
                } else {
                    break
                }
                n = n / 2
            }
            
        }
        
        return results
        
    }
    
    func ajustHeap(point: [Int], heap: inout [Result]) {
        
        guard !heap.isEmpty else {
            return
        }
        
        let r = calDistance(point)
        guard r < heap[0].res else {
            return
        }
        heap.append(Result(res: r, point: point))
        swap(heap.count - 1, 0, &heap)
        let _ = heap.removeLast()
        
        var n = 0
        while n < heap.count  {
            
            let leftChild = 2 * n + 1
            let rightChild = 2 * n + 2
            
            let left = leftChild <= (heap.count - 1) ? heap[leftChild] : Result()
            let right = rightChild <= (heap.count - 1) ? heap[rightChild] : Result()
            
            if left.res > heap[n].res && left.res > right.res {
                swap(leftChild, n, &heap)
                n = leftChild
            } else if right.res > left.res && right.res > heap[n].res {
                swap(rightChild, n, &heap)
                n = rightChild
            } else {
                return
            }
            
        }
        
    }
    
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        
        guard k <= points.count else {
            return [[Int]]()
        }
        
        var heap = buildHeap(Array(points[..<k]))
        
        for point in points[k..<points.count] {
            ajustHeap(point: point, heap: &heap)
        }
        
        return heap.map { $0.point }
        
    }
    
    func test() {
        
//        print(kClosest([[1,3],[-2,2]], 2))
//        print(kClosest([[3,3],[5,-1],[-2,4]], 2))
//        print(kClosest([[1,3],[-2,2],[2,-2]], 3))
//
//        print(kClosest([[6,10],[-3,3],[-2,5],[100, 2],[0,2]], 3))
        print(kClosest([[100,-16],[-31,45],[80,-47],[41,59],[-59,-34],[-34,-76],[-5,-77],[35,40],[58,-30],[31,-96],[40,14],[-25,50],[37,-38],[-54,-31]], 8))
        
    }
    
}
