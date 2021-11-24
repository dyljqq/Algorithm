//
//  986.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/24.
//

import Foundation

/// 986. Interval List Intersections
/// https://leetcode.com/problems/interval-list-intersections/

class Leetcode986 {
    
//    func intersection(_ first: [Int], _ second: [Int]) -> ([Int], [Int]) {
//        if first[0] <= second[0] {
//            if first[1] < second[0] {
//                return ([], second)
//            } else {
//                return first[1] > second[1] ? (second, [second[1] + 1, first[1]]) : ([second[0], first[1]], [second[0] + 1, second[1]])
//            }
//        }
//        return intersection(second, first)
//    }
//
//    func helper(_ list: [[Int]], _ index: Int, _ next: [Int]) -> [[Int]] {
//        var rs: [[Int]] = []
//        var temp = [Int]()
//        var next = next
//        var index = index
//        while index < list.count {
//            (temp, next) = intersection(list[index], next)
//            index += 1
//            if !temp.isEmpty {
//                rs.append(temp)
//            }
//        }
//        return rs
//    }
//
//    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
//        guard firstList.count > 0 && secondList.count > 0 else {
//            return []
//        }
//        var fi = 0, si = 0
//        var (temp, next) = ([Int](), [Int]())
//        var results: [[Int]] = []
//        while fi < firstList.count && si < secondList.count {
//            if next.count > 0 {
//                if firstList[fi][0] <= secondList[si][0] {
//                    (temp, next) = intersection(firstList[fi], next)
//                    fi += 1
//                } else {
//                    (temp, next) = intersection(secondList[si], next)
//                    si += 1
//                }
//            } else {
//                (temp, next) = intersection(firstList[fi], secondList[si])
//                si += 1
//                fi += 1
//            }
//            if !temp.isEmpty {
//                results.append(temp)
//            }
//        }
//        var h = helper(firstList, fi, next)
//        if !h.isEmpty {
//            results.append(contentsOf: h)
//        }
//        h = helper(secondList, si, next)
//        if !h.isEmpty {
//            results.append(contentsOf: h)
//        }
//        return results
//    }
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var ans: [[Int]] = []
        var idx1 = 0
        var idx2 = 0
        while idx1 != firstList.count && idx2 != secondList.count {
            if firstList[idx1][1] < secondList[idx2][0] {
                idx1 += 1
            } else if secondList[idx2][1] < firstList[idx1][0] {
                idx2 += 1
            } else {
                ans.append([max(firstList[idx1][0], secondList[idx2][0]), min(firstList[idx1][1], secondList[idx2][1])])
                if firstList[idx1][1] > secondList[idx2][1] {
                    idx2 += 1
                } else if firstList[idx1][1] < secondList[idx2][1] {
                    idx1 += 1
                } else {
                    idx2 += 1
                    idx1 += 1
                }
            }
        }
        return ans
    }
    
    func test() {
        /// [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
        print(intervalIntersection([[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26], [27, 30]]))
        print(intervalIntersection([[1,3],[5,9]], []))
        print(intervalIntersection([], [[4,8],[10,12]]))
        print(intervalIntersection([[1,7]], [[3,10]]))
        print(intervalIntersection([[5, 10]], [[5, 6]]))
        print(intervalIntersection([[14,16]], [[7,13],[16,20]]))
        print(intervalIntersection([[8, 15]], [[2,6],[8,10],[12,20], [21, 30]]))
    }
}
