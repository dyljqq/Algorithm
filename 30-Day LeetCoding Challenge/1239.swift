//
//  1239.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/23.
//

import Foundation

class Solution1239 {
    
    func maxLength(_ arr: [String]) -> Int {
        let cleanedArr = arr.filter { Set($0).count == $0.count }
        return dfs(cleanedArr, "", 0)
    }

    func dfs(_ arr: [String], _ path: String, _ start: Int) -> Int {
        var maxLen = path.count
        for i in start..<arr.count {
            if !isUnique(path, arr[i]) { continue }
            maxLen = max(maxLen, dfs(arr, path + arr[i], i + 1))
        }
        return maxLen
    }

    func isUnique(_ s1: String, _ s2: String) -> Bool {
        let concat = s1 + s2
        return Set(concat).count == concat.count
    }
    
    func test() {
        print(maxLength(["un","iq","ue"]))
        print(maxLength(["cha","r","act","ers"]))
        print(maxLength(["abcdefghijklmnopqrstuvwxyz"]))
    }
}
