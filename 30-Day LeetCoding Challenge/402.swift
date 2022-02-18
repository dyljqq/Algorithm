//
//  402.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/2/18.
//

import Foundation

/**
 402. Remove K Digits
 https://leetcode.com/problems/remove-k-digits/
 
 题目的意思就是让我去除数组中的k个数字，使得这个数组组成的数字是最小的。
 我们知道，只要能够保证高位的数字小于低位的，那么这个数字一定是最小的。因此我们可以通过一个栈，来维护这个递增的数组。代码如下：
 */

class Leetcode402 {
    
    func removeKdigits(_ num: String, _ k: Int) -> String {
        guard num.count > k else {
            return "0"
        }
        
        let total = num.count - k
        var stack: [String.Element] = []
        let arr = Array(num)
        
        for i in 0..<arr.count {
            let rest = arr.count - i
            while (rest + stack.count) > total, let top = stack.last, top > arr[i] {
                stack.removeLast()
            }
            stack.append(arr[i])
        }
        
        stack = Array(stack[0..<total])
        var count = 0
        while count < stack.count, stack[count] == "0" {
            count = count + 1
        }
        stack = count == stack.count ? [] : Array(stack[count..<stack.count])
        return stack.isEmpty ? "0" : String(stack)
    }
    
    func test() {
        print(removeKdigits("1432219", 3))
        print(removeKdigits("10200", 1))
        print(removeKdigits("10", 2))
        print(removeKdigits("10", 1))
    }
    
}
