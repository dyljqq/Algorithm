//
//  KthSmallestElementInASortedMatrix.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/8.
//

import Foundation

class KthSmallestElementInASortedMatrix {
    
//    func swap(_ i: Int, _ j: Int, _ matrix: inout [Int]) {
//        let temp = matrix[i]
//        matrix[i] = matrix[j]
//        matrix[j] = temp
//    }
//
//    func buildHeap(_ matrix: [Int]) -> [Int] {
//        var res = [Int]()
//
//        for value in matrix {
//            res.append(value)
//            var n = res.count
//            while n > 1 {
//                let pre = n / 2 - 1
//                if res[pre] < res[n - 1] {
//                    swap(pre, n - 1, &res)
//                } else {
//                    break
//                }
//                n = n / 2
//            }
//        }
//
//        return res
//    }
//
//    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
//        guard !matrix.isEmpty && matrix.count * matrix[0].count >= k else {
//            return 0
//        }
//        guard matrix.count > 1 else {
//            return matrix[0][k - 1]
//        }
//
//        let matrix = matrix.reduce([], +)
//        var heap = buildHeap(Array(matrix[..<k]))
//
//        for value in matrix[k...] {
//            if value < heap.first! {
//                heap.append(value)
//                swap(0, heap.count - 1, &heap)
//                let _ = heap.removeLast()
//
//                var index = 0
//                while index < heap.count {
//                    let left = 2 * index + 1
//                    let right = 2 * index + 2
//                    let leftValue = left < heap.count ? heap[left] : Int.min
//                    let rightValue = right < heap.count ? heap[right] : Int.min
//                    let target = heap[index]
//
//                    if leftValue >= target && leftValue >= rightValue {
//                        swap(left, index, &heap)
//                        index = left
//                    } else if rightValue >= leftValue && rightValue >= target {
//                        swap(right, index, &heap)
//                        index = right
//                    } else {
//                        break
//                    }
//                }
//            }
//        }
//        return heap.first!
//    }
    
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        guard !matrix.isEmpty && matrix.count * matrix[0].count >= k else {
            return 0
        }
        guard matrix.count > 1 else {
            return matrix[0][k - 1]
        }
        
        let n = matrix.count
        var left = matrix[0][0], right = matrix[n - 1][n - 1]
        while left < right {
            let mid = (left + right) / 2
            if getCount(matrix, k, mid) < k {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return right
    }
    
    func getCount (_ matrix: [[Int]], _ k: Int, _ mid: Int) -> Int {
        var row = matrix.count - 1, column = 0
        var cnt = 0
        while row >= 0 && column < matrix.count {
            let value = matrix[row][column]
            if mid >= value {
                cnt += row + 1
                column += 1
            } else {
                row -= 1
            }
        }
        return cnt
    }
    
    func test() {
        print(kthSmallest([[1,5,9],[10,11,13],[12,13,15]], 8))
        print(kthSmallest([[15]], 1))
        print(kthSmallest([[1,4],[2,5]], 3))
        print(kthSmallest([[4,7,11],[7,11,16],[10,11,20]], 6))
    }
    
}
