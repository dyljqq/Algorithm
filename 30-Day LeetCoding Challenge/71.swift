//
//  71.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/3/14.
//

import Foundation

class Leetcode71 {
    
    func simplifyPath(_ path: String) -> String {
        let paths = path.split(separator: "/")
        
        var stack = [String]()
        for p in paths {
            if p.isEmpty || p == "." {
                continue
            } else if p == ".." && !stack.isEmpty {
                stack.removeLast()
            } else if p != ".." {
                stack.append(String(p))
            }
        }
        
        return stack.isEmpty ? "/" : stack.reduce("") { $0 + "/" + $1 }
    }
    
    func test() {
        let paths = [
            "/home/",
            "/../",
            "/home//foo/"
        ]
        for path in paths {
            print(simplifyPath(path))
        }
    }
    
}
