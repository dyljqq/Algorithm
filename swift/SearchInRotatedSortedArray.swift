//
//  SearchInRotatedSortedArray.swift
//  LeetCode
//
//  Created by 季勤强 on 2019/2/15.
//  Copyright © 2019 dyljqq. All rights reserved.
//

import Foundation

class SearchInRotatedSortedArray {
  
  func search(_ nums: [Int], _ target: Int) -> Int {
    var l = 0
    var r = nums.count - 1
    
    while l <= r {
      let mid = l + (r - l) >> 1
      if (nums[mid] == target) {
        return mid
      }
      if nums[l] <= nums[mid] {
        // 转折点在右边, 那么左边就是严格的递增的
        if (target < nums[mid] && target >= nums[l]) {
          r = mid - 1
        } else {
          l = mid + 1
        }
      } else {
        // 转折点在左边
        if (nums[mid] < target && nums[r] >= target) {
          l = mid + 1
        } else {
          r = mid - 1
        }
      }
    }
    return -1
  }
  
  func test() {
    let arr = [4,5,6,7,0,1,2]
    print(search(arr, 0))
    print(search(arr, 3))
  }
  
}
