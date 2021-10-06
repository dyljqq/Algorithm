//
//  FindAllDuplicateInAArray.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/6.
//

import Foundation

class FindAllDuplicateInAArray {
    
//    func findDuplicates(_ nums: [Int]) -> [Int] {
//        var rs = [Int]()
//        var set = Set<Int>()
//        for num in nums {
//            if set.contains(num) {
//                rs.append(num)
//            } else {
//                set.insert(num)
//            }
//        }
//        return rs
//    }
    
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var frequenceArray = Array(repeating: 0, count: nums.count + 1)
        var rs = [Int]()
        
        for num in nums {
            frequenceArray[num - 1] = frequenceArray[num - 1] + 1
            if frequenceArray[num - 1] == 2 {
                rs.append(num)
            }
        }
        return rs
    }
    
}
