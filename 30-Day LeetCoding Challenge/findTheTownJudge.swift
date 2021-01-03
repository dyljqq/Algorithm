//
//  findTheTownJudge.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/1/3.
//

import Foundation

class FindTheTownJudge {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        guard !trust.isEmpty else {
            return N <= 1 ? 1 : -1
        }
        var reJudges = Array(repeating: 0, count: N + 1)
        var judges = Array(repeating: 0, count: N + 1)
        let _ = trust.map { arr in
            judges[arr[1]] += 1
            reJudges[arr[0]] += 1
        }
        
        for i in 0..<judges.count {
            if judges[i] == N - 1 && reJudges[i] == 0 {
                return i
            }
        }
        
        return -1
    }
    
    func test() {
        print(findJudge(3, [[1,3],[2,3]]))
        print(findJudge(2, [[1,2]]))
        print(findJudge(3, [[1,3],[2,3],[3,1]]))
        print(findJudge(3, [[1,2],[2,3]]))
        print(findJudge(4, [[1,3],[1,4],[2,3],[2,4],[4,3]]))
    }
}
