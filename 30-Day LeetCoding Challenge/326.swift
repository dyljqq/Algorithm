//
//  326.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/24.
//

import Foundation

class Leetcode326 {
  
  func isPowerOfThree(_ n: Int) -> Bool {
    return n > 0 && Int(pow(3, floor(log(Double(n)) / log(3) + 0.5))) == n
  }
  
  func test() {
    print(isPowerOfThree(27))
    print(isPowerOfThree(0))
    print(isPowerOfThree(9))
    print(isPowerOfThree(10))
    print(isPowerOfThree(243))
  }
  
}
