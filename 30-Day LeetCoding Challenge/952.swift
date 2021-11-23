//
//  952.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/23.
//

import Foundation

/// https://leetcode.com/problems/largest-component-size-by-common-factor/
///  正常的解法会导致超时，因此需要做一些优化。
///
/// 1. 分解质因素 2. 确保根节点的值是最小的
class Leetcode952 {
    
    public class UnionFind {
        
        public private(set) var arr: [Int]
        public private(set) var size: [Int]

        public init(_ n: Int) {
            self.arr = Array(0 ... n)
            self.size = Array(repeating: 1, count: n + 1)
        }

        public func union(_ p: Int, _ q: Int) {
            let pid = group(p)
            let qid = group(q)
            guard pid != qid else { return }
            let (small, big) = size[pid] < size[qid] ?
                (pid, qid) : (qid, pid)
            size[big] += size[small]
            arr[small] = big
        }

        public func find(_ p: Int, _ q: Int) -> Bool {
            let pid = group(p)
            let qid = group(q)
            return pid == qid
        }
        
        public func group(_ r: Int) -> Int {
            var r = r
            while arr[r] != r {
                r = arr[r]
            }
            return r
        }
    }
    
    func largestComponentSize(_ nums: [Int]) -> Int {
        let mx = (nums.max() ?? 0) + 1
        let dsu = UnionFind(mx)
        var map: [Int: Int] = [:]
        for num in nums {
            let factors = getFactors(num)
            map[num] = factors[0]
            for index in 0..<factors.count - 1 where factors[index] != factors[index + 1] {
                dsu.union(factors[index], factors[index + 1])
            }
        }
        
        var ans = 0
        var hash: [Int: Int] = [:]
        for num in nums {
            let group = dsu.group(map[num]!)
            hash[group, default: 0] += 1
            ans = max(hash[group]!, ans)
        }
        
        return ans
    }
    
    func getFactors(_ num: Int) -> [Int] {
        var rs = [Int]()
        var factor = 2
        var num = num, prev = 1
        
        while factor * factor <= num {
            if num % factor == 0 {
                if prev != factor {
                    rs.append(factor)
                }
                prev = factor
                num = num / factor
            } else {
                factor += 1
            }
        }
        if !rs.contains(num) {
            rs.append(num)
        }
        return rs
    }
    
    func test() {
        print(largestComponentSize([4, 6, 15, 35]))
        print(largestComponentSize([2,3,6,7,4,12,21,39]))
        print(largestComponentSize([20,50,9,63]))
    }
    
}
