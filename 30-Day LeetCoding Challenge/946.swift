//
//  946.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/3/16.
//

import Foundation

class Leetcode946 {
    
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int]()
        var poppedIndex = 0
        for num in pushed {
            stack.append(num)
            while poppedIndex < popped.count, let top = stack.last, popped[poppedIndex] == top {
                stack.removeLast()
                poppedIndex = poppedIndex + 1
            }
        }
        
        while poppedIndex < popped.count {
            if let top = stack.last, popped[poppedIndex] != top {
                return false
            }
            stack.removeLast()
            poppedIndex = poppedIndex + 1
        }
        
        return true
    }
    
    func test() {
        print(validateStackSequences([1,2,3,4,5], [4,5,3,2,1]))
        print(validateStackSequences([1,2,3,4,5], [4,3,5,1,2]))
        print(validateStackSequences([1,0], [1,0]))
    }
    
}
