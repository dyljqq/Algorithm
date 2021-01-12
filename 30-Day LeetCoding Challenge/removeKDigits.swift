//
//  removeKDigits.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/1/12.
//

import Foundation

class RemoveKDigits {

    func removeKdigits(_ num: String, _ k: Int) -> String {
        guard !num.isEmpty, k < num.count else {
            return "0"
        }
        
        let keep = num.count - k
        
        let n = num.count
        var arr = [Character]()
        let nums = Array(num)
        
        for i in 0..<n {
            let rest = n - i
            let c = nums[i]
            while (arr.count + rest) > keep, let top = arr.last, top > c {
                arr.removeLast()
            }
            arr.append(c)
        }
        
        arr = Array(arr[0..<keep])
        while arr.count > 1, String(arr[0]) == "0" {
            arr.removeFirst()
        }
        
        return String(arr)
    }
    
    func test() {
        print(removeKdigits("1432219", 3))
        print(removeKdigits("10200", 1))
        print(removeKdigits("10", 1))
        print(removeKdigits("112", 1))
        print(removeKdigits("1234567890", 8))
    }
    
}
