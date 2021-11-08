//
//  UniqueBinarySearchTrees.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/8.
//

import Foundation

class UniqueBinarySearchTrees {
    
//    if(n == 1)
//                return 1;
//            else if(n == 2)
//                return 2;
//            int count[100] = {0};
//            count[0] = 1;
//            count[1] = 1;
//            int sum = 0;
//            for(int i = 2; i <= n; i++){
//                for(int j = 0; j < i; j++){
//                    count[i] += count[i - j - 1] * count[j];
//                }
//            }
//            return count[n];
    // 卡特兰数
    func numTrees(_ n: Int) -> Int {
        if n == 1 {
            return 1
        } else if n == 2 {
            return 2
        }
        
        var rs = Array(repeating: 0, count: 101)
        rs[0] = 1
        rs[1] = 1
        for i in 2...n {
            for j in 0..<i {
                rs[i] += rs[i - j - 1] * rs[j]
            }
        }
        return rs[n]
    }
    
}
