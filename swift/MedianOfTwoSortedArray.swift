//
//  MedianOfTwoSortedArray.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/7/10.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class MedianOfTwoSortedArray {
  
  func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let (nums1, nums2) = nums1.count > nums2.count ? (nums1, nums2) : (nums2, nums1)
    let (n, m) = (nums1.count, nums2.count)
    
    let k = (n + m - 1) / 2
    var (l, r) = (0, min(m, k))
    while l < r {
      let ma = (l + r) / 2
      let mb = k - ma
      if nums1[mb] < nums2[ma] {
        r = ma
      } else {
        l = ma + 1
      }
    }
    
    let a = max(l > 0 ? nums2[l - 1] : Int.min, k - l >= 0 ? nums1[k - l] : Int.min)
    if ((n + m) % 2 == 1) {
      return Double(a)
    }
    
    let b = min(l < m ? nums2[l] : Int.max, (k - l + 1) < n ? nums1[k - l + 1] : Int.max)
    
    return Double(a + b) / 2.0
  }
  
  func test() {
    var a = [1, 3]
    var b = [2]
    print(findMedianSortedArrays(a, b))
    
    a = [1, 2]
    b = [3, 4]
    print(findMedianSortedArrays(a, b))
    
    a = []
    b = [2, 3]
    print(findMedianSortedArrays(a, b))
  }
  
}
