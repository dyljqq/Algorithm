//
//  DecodeWaysTwo.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/11.
//

import Foundation

class DecodeWaysTwo {
    
    func numDecodings(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        var dp = (1, helper(String(s.first!), nil))
        
        let M = Int((pow(10.0, 9) + 7))
        let arr = Array(s)
        for i in 1..<s.count {
            let v = dp.0 * helper(String(arr[i - 1]), String(arr[i])) + dp.1 * helper(String(arr[i]), nil)
            dp.0 = dp.1
            dp.1 = v % M
        }
        
        return dp.1
    }
    
    func helper(_ c1: String, _ c2: String?) -> Int {
        if let c2 = c2 {
            if c1 == "*" && c2 == "*" {
                return 15
            } else if c1 == "*" {
                return (Int(c2)! >= 0 && Int(c2)! <= 6) ? 2 : 1
            } else if c2 == "*" {
                switch c1 {
                case "1": return 9
                case "2": return 6
                default: return 0
                }
            } else {
                let v = Int(c1)! * 10 + Int(c2)!
                if v >= 10 && v <= 26 {
                    return 1
                }
            }
        } else {
            switch c1 {
            case "0": return 0
            case "*": return 9
            default: return 1
            }
        }
        
        return 0
    }
    
    func test() {
        print(numDecodings("1*"))
        print(numDecodings("2*"))
        print(numDecodings("3*"))
        print(numDecodings("*0"))
        print(numDecodings("*1*1*0"))
        print(numDecodings("*0**0"))
        var str = ""
        for i in 0..<9 {
            str += "*"
            print("\(str): \(numDecodings(str))")
        }
//        print(numDecodings("**"))
//        print(numDecodings("*********"))
//        print(numDecodings("1*6*7*1*9*6*2*9*2*3*3*6*3*2*2*4*7*2*9*6*0*6*4*4*1*6*9*0*5*9*2*5*7*7*0*6*9*7*1*5*5*9*3*0*4*9*2*6*2*5*7*6*1*9*4*5*8*4*7*4*2*7*1*2*1*9*1*3*0*6*"))
    }
    
}
