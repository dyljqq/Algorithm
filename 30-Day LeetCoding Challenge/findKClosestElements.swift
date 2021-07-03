//
//  findKClosestElements.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/3.
//

import Foundation

class FindKClosestElements {
    
//    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
//
//        guard !arr.isEmpty && k < arr.count else {
//            return arr
//        }
//
//        guard x >= arr.first! else {
//            return Array(arr[..<k])
//        }
//
//        guard x <= arr.last! else {
//            return Array(arr[(arr.count - k)...])
//        }
//
//        var left = 0
//        var right = arr.count
//
//        while left < right {
//
//            let mid = (left + right) / 2
//            if arr[mid] == x {
//                left = mid
//                break
//            } else if arr[mid] > x {
//                right = mid
//            } else {
//                left = mid + 1
//            }
//
//        }
//
//        var rs = [Int]()
//
//        var leftShift = 0
//        var rightShift = 0
//
//        left = left > 0 && abs(arr[left] - x) >= abs(arr[left - 1] - x) ? left - 1 : left
//        while rs.count < k {
//
//            let leftValue = (left + leftShift) >= 0 && (left + leftShift) < arr.count ? abs(arr[left + leftShift] - x) : Int.max
//            let rightValue = (left + rightShift) < arr.count && (left + rightShift) >= 0 ? abs(arr[left + rightShift] - x) : Int.max
//
//            if leftValue <= rightValue {
//                rs.append(arr[left + leftShift])
//                leftShift -= 1
//            } else {
//                rs.append(arr[left + rightShift])
//                rightShift += 1
//            }
//        }
//
//        return rs.sorted()
//    }
    
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        
        guard !arr.isEmpty && k < arr.count else {
            return arr
        }

        guard x >= arr.first! else {
            return Array(arr[..<k])
        }

        guard x <= arr.last! else {
            return Array(arr[(arr.count - k)...])
        }
        
        var diff = arr[..<k].reduce(0) { $0 + abs($1 - x) }
        
        var minDiff = diff
        var index = k - 1
        
        for i in k..<arr.count {
            
            diff = diff + (abs(x - arr[i]) - abs(x - arr[i - k]))
            
            if diff < minDiff {
                minDiff = diff
                index = i
            }
            
        }
        
        return Array(arr[(index - k + 1)...index])
        
//        let n = arr.count
//                guard k < n else { return arr }
//                var diff = 0
//                for i in 0..<k {
//                    diff += abs(x - arr[i])
//                }
//                var minDiff = diff, minDiffIndex = k - 1
//                for i in k..<n {
//                    diff += abs(x - arr[i]) - abs(x - arr[i - k])
//                    if diff < minDiff {
//                        minDiff = diff
//                        minDiffIndex = i
//                    }
//                }
//                return Array(arr[(minDiffIndex - (k - 1)...minDiffIndex)])
        
    }
    
    func test() {
        
//        print(findClosestElements([1,2,3,4,5], 4, -1))
//        print(findClosestElements([-2,-1,1,2,3,4,5], 7, 3))
//        print(findClosestElements([0,1,1,1,2,3,6,7,8,9], 9, 9))
//        print(findClosestElements([0,0,1,2,3,3,4,7,7,8], 3, 5))
        print(findClosestElements([1, 2], 1, 1))
        
    }
    
}
