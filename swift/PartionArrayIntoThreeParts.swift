//
//  PartionArrayIntoThreeParts.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/11.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class PartionArrayIntoThreeParts {
  
//  func helper(_ p: Int, _ part: Int, _ A: [Int]) -> Int {
//    var count = 0
//    for i in p..<A.count {
//      count += A[i]
//      if count == part {
//        return i + 1
//      }
//    }
//    return -1
//  }
//
//  func canThreePartsEqualSum(_ A: [Int]) -> Bool {
//    guard A.count >= 3 else {
//      return false
//    }
//    let total = A.reduce(0) { $0 + $1 }
//    guard total % 3 == 0 else { return false }
//    let partion = total / 3
//    var count = 2
//    var p = 0
//    while count > 0 {
//      p = helper(p, partion, A)
//      if p == -1 {
//        return false
//      }
//      count -= 1
//    }
//
//    return (p..<A.count).reduce(0) { $0 + A[$1] } == partion
//  }
  
//  func helper(_ p: Int, _ partion: Int, _ A: [Int], _ retry: Int) -> Bool {
//    var canPart = false
//    guard retry > 0 && p < A.count else { return canPart }
//    var count = 0
//    if retry == 1 {
//      return (p..<A.count).reduce(0) { $0 + A[$1] } == partion
//    } else {
//      for i in p..<A.count {
//        count += A[i]
//        if count == partion {
//          canPart = canPart || helper(i + 1, partion, A, retry - 1)
//        }
//      }
//    }
//    return canPart
//  }
//
//  func canThreePartsEqualSum(_ A: [Int]) -> Bool {
//    guard A.count >= 3 else { return false }
//    let total = A.reduce(0) { $0 + $1 }
//    guard total % 3 == 0 else { return false }
//    let partion = total / 3
//    return helper(0, partion, A, 3)
//  }
  
//  func canThreePartsEqualSum(_ A: [Int]) -> Bool {
//    guard A.count >= 3 else { return false }
//    let total = A.reduce(0) { $0 + $1 }
//    guard total % 3 == 0 else { return false }
//    let partion = total / 3
//    var flag = 0
//    var count = 0
//    for a in A {
//      count += a
//      if count == partion {
//        flag += 1
//        count = 0
//      }
//      if flag == 3 {
//        return true
//      }
//    }
//    return false
//  }
  
  func canThreePartsEqualSum(_ A: [Int]) -> Bool {
    guard A.count >= 3 else { return false }
    let total = A.reduce(0) { $0 + $1 }
    guard total % 3 == 0 else { return false }
    let partion = total / 3
    
    var left = 0
    var right = A.count - 1
    var leftSum = A[left]
    var rightSum = A[right]
    while left + 1 < right {
      
      if leftSum == partion && rightSum == partion {
        return true
      }
      
      if leftSum != partion {
        left += 1
        leftSum += A[left]
      }
      if rightSum != partion {
        right -= 1
        rightSum += A[right]
      }
    }
    return false
  }
  
  func test() {
    print(canThreePartsEqualSum([0,2,1,-6,6,-7,9,1,2,0,1]))
    print(canThreePartsEqualSum([0,2,1,-6,6,7,9,-1,2,0,1]))
    print(canThreePartsEqualSum([3,3,6,5,-2,2,5,1,-9,4]))
    print(canThreePartsEqualSum([10,-10,10,-10,10,-10,10,-10]))
    print(canThreePartsEqualSum([0, 0, 0, 0, 0, 0]))
    print(canThreePartsEqualSum([0, 0]))
    print(canThreePartsEqualSum([1,-1,1,-1]))
  }
}
