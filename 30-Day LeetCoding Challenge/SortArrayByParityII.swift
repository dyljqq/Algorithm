//
//  SortArrayByParity.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/9/29.
//

import Foundation

class SortArrayByParityII {
    
//    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
//        var rs = nums
//        var odds: [Int] = [], evens: [Int] = []
//        for (index, num) in nums.enumerated() {
//            if index % 2 == 0 && num % 2 == 1 {
//                evens.append(index)
//            } else if index % 2 == 1 && num % 2 == 0 {
//                odds.append(index)
//            }
//        }
//
//        for index in 0..<odds.count {
//            rs.swapAt(odds[index], evens[index])
//        }
//
//        return rs
//    }
    
//    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
//        var nums = nums
//        var oddIndex = 1, evenIndex = 0
//        while oddIndex < nums.count && evenIndex < nums.count {
//            while oddIndex < nums.count && oddIndex % 2 == 1 && nums[oddIndex] % 2 == 1 {
//                oddIndex += 2
//            }
//            while evenIndex < nums.count && evenIndex % 2 == 0 && nums[evenIndex] % 2 == 0 {
//                evenIndex += 2
//            }
//
//            if oddIndex < nums.count && evenIndex < nums.count {
//                nums.swapAt(oddIndex, evenIndex)
//            }
//        }
//        return nums
//    }
    
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var nums = nums
         var odd = 1, even = 0
        for num in nums {
            if num % 2 == 0 {
                nums[even] = num
                even += 2
            } else {
                nums[odd] = num
                odd += 2
            }
        }
        return nums
    }
    
    func test() {
        print(sortArrayByParityII([4,2,5,7]))
        print(sortArrayByParityII([2,3]))
        print(sortArrayByParityII([648,831,560,986,192,424,997,829,897,843]))
    }
    
}
